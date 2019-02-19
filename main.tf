resource "aws_sns_topic" "main" {
  name = "${var.sns_topic_name}"
}

resource "aws_sns_topic_subscription" "topic" {
  topic_arn              = "${aws_sns_topic.main.arn}"
  protocol               = "${var.protocol}"
  endpoint               = "${var.endpoint_arn}"
  endpoint_auto_confirms = "${var.endpoint_auto_confirms}"
  depends_on             = ["aws_sns_topic.main"]
  raw_message_delivery   = "${var.raw_message_delivery}"
}
