resource "aws_cloudwatch_metric_alarm" "sqs_age_of_oldest_message_alarm" {
  alarm_name          = "SQS-ApproximateAgeOfOldestMessage-Alarm"
  alarm_description   = "Alarm for when the threshould is exceeded"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "ApproximateAgeOfOldestMessage"
  namespace           = "AWS/SQS"
  period              = 60
  statistic           = "Maximum"
  threshold           = 300
  dimensions = {
    QueueName = aws_sqs_queue.generator_for_images_queue.name
  }
  # sending a notification to the simple notification service (sns) topic
  alarm_actions = [aws_sns_topic.alarm_topic.arn]
}
