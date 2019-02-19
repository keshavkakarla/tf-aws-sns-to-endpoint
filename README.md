# tf-aws-sns-to-endpoint

## Overview

Creates an SNS Topic with and endpoint communication

## Usage:

#### Lambda:
```
module "sns_topic" {
  source         = "../modules/tf-aws-sns-to-endpoint"
  sns_topic_name = "my-topic-name"
  protocol       = "lambda"
  endpoint_arn   = "arn:aws:lambda:REGION:ACCOUNT-ID:function:FUNCTION-NAME"
}
```

#### SQS:
```
module "sns_topic" {
  source         = "../modules/tf-aws-sns-to-endpoint"
  sns_topic_name = "my-topic-name"
  protocol       = "sqs"
  endpoint_arn   = "arn:aws:sqs:REGION:ACCOUNT-ID:QUEUE-NAME"
}
```

#### To suscribe an ASG (or a set of ASGs) to this SNS Topic:
```
module "sns_topic" {
  ...
}

resource "aws_autoscaling_notification" "instance_terminate" {
  group_names   = [ "${split(",", var.asg_group_names)}" ]
  topic_arn     = "${module.sns_topic.arn}"

  notifications = [
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]
}
```

## Inputs

| Name | Description | Default | Required |
|------|-------------|:-----:|:-----:|
| endpoint_arn | Endpoint ARN to communicate with | - | yes |
| endpoint_auto_confirms | Boolean indicating whether the end point is capable of auto confirming subscription | `false` | no |
| protocol | Protocol the SNS Function will use, should match the Endpoint's protocol | - | yes |
| raw_message_delivery | Boolean indicating whether or not to enable raw message delivery (the original message is directly passed, not wrapped in JSON with the original message in the message property) | `false` | no |
| sns_topic_name | SNS Topic name | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | SNS Topic ARN |
## Development

Please see the [CONTRIBUTING.md](CONTRIBUTING.md) file for instructions regarding the contribution to this repository.
