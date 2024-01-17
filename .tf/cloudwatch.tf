resource "aws_cloudwatch_event_rule" "every_month" {
  name = "every-month"
  description = "Sends a trigger every month"
  schedule_expression = "rate(30 days)"
  state = "DISABLED"
}

resource "aws_cloudwatch_event_target" "trigger_cmo_strategy" {
  rule = "${aws_cloudwatch_event_rule.every_month.name}"
  target_id = "spotify_analysis"
  arn = "${aws_lambda_function.spotify_analysis.arn}"
}
