resource "aws_sqs_queue" "generator_for_images_queue" {
  name                       = "generator_for_images_queue"
  visibility_timeout_seconds = 60
  message_retention_seconds  = 86400
}