resource "aws_lambda_function" "sqs_lambda" {
  function_name = "sqs-lambda-function"
  handler       = "lambda_sqs.lambda_handler"
  role          = aws_iam_role.lambda_execution_role.arn
  runtime       = "python3.10"
  timeout       = 60

  filename = data.archive_file.lambda_zip.output_path

  environment {
    variables = {
      BUCKET_NAME = "pgr301-couch-explorers"
    }
  }
}

resource "aws_lambda_event_source_mapping" "sqs_event_source" {
  event_source_arn  = aws_sqs_queue.generator_for_images_queue.arn
  function_name     = aws_lambda_function.sqs_lambda.arn
  batch_size        = 1
  enabled           = true
}

resource "aws_lambda_permission" "allow_sqs_invoke" {
  statement_id  = "AllowExecutionFromSQS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.sqs_lambda.function_name
  principal     = "sqs.amazonaws.com"
  source_arn    = aws_sqs_queue.generator_for_images_queue.arn
}

