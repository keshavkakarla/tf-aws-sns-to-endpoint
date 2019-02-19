// SNS Topic ARN
output "arn" {
  value = "${aws_sns_topic.main.arn}"
}
