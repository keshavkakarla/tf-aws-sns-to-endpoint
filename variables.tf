variable "sns_topic_name" {
  description = "SNS Topic name"
}

variable "endpoint_arn" {
  description = "Endpoint ARN to communicate with"
}

variable "protocol" {
  description = "Protocol the SNS Function will use, should match the Endpoint's protocol"
}

variable "raw_message_delivery" {
  description = "Boolean indicating whether or not to enable raw message delivery (the original message is directly passed, not wrapped in JSON with the original message in the message property)"
  default     = false
}

variable "endpoint_auto_confirms" {
  description = "Boolean indicating whether the end point is capable of auto confirming subscription"
  default     = false
}
