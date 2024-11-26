resource "aws_sns_topic" "alarm_topic" {
  name = "sqs-cloudwatch-alarm-topic"
}

# this is what subscribes the specified email address to the sns topic
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.alarm_topic.arn
  protocol  = "email"
  endpoint  = var.email_notification
}
