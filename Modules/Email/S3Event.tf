resource "aws_lambda_permission" "allow_s3" {
  statement_id  = "AllowExecutionFromS3"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.send_email_lambda.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::tfstatebktseifhendawyiti"
}

resource "aws_s3_bucket_notification" "notify_lambda" {
  bucket = "tfstatebktseifhendawyiti"

  lambda_function {
    lambda_function_arn = aws_lambda_function.send_email_lambda.arn
    events              = ["s3:ObjectCreated:*", "s3:ObjectRemoved:*"]
  }

  depends_on = [aws_lambda_permission.allow_s3]
}
