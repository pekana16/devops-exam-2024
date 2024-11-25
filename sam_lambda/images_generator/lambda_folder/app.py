import base64
import traceback

import boto3
import json
import random
import os  # for dynamic fetching

def lambda_handler(event, context):
        # Prompt from the HTTP POST request body is extracted here
        body = json.loads(event["body"])
        prompt = body["prompt"]

        # Set up the AWS clients
        bedrock_client = boto3.client("bedrock-runtime", region_name="us-east-1")
        s3_client = boto3.client("s3")

        # Define the model ID and S3 bucket name (replace with your actual bucket name)
        model_id = "amazon.titan-image-generator-v1"
        bucket_name = os.environ["BUCKET_NAME"] # using "os.environ" to fetch the bucket name dynamically

        seed = random.randint(0, 2147483647)
        candidate_number = "39"  # Adding my candidate number
        s3_image_path = f"{candidate_number}/titan_{seed}.png"


        native_request = {
            "taskType": "TEXT_IMAGE",
            "textToImageParams": {"text": prompt},
            "imageGenerationConfig": {
                "numberOfImages": 1,
                "quality": "standard",
                "cfgScale": 8.0,
                "height": 1024,
                "width": 1024,
                "seed": seed,
            }
        }

        response = bedrock_client.invoke_model(modelId=model_id, body=json.dumps(native_request))
        model_response = json.loads(response["body"].read())

        # Extract and decode the Base64 image data
        base64_image_data = model_response["images"][0]
        image_data = base64.b64decode(base64_image_data)

        # Upload the decoded image data to S3
        s3_client.put_object(Bucket=bucket_name, Key=s3_image_path, Body=image_data)

        # Building the S3 URI
        s3_uri = f"s3://{bucket_name}/{s3_image_path}"

        # Making sure that success response is being returned
        return {
            "statusCode": 200,
            "body": json.dumps({
                "message": "Image has been successfully generated.",
                "s3_key": s3_image_path,
                "s3_uri": s3_uri
            })
        }
