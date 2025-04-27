data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda2" {
  name               = "iam_for_lambda2"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy" "lambda_policy" {
  name = "lambda_send_email_policy"
  role = aws_iam_role.iam_for_lambda2.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ses:SendEmail",
          "ses:SendRawEmail"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_lambda_function" "send_email_lambda" {
  filename      = "Modules/Email/lambda.zip"
  function_name = "send-email-lambda"
  role          = aws_iam_role.iam_for_lambda2.arn
  handler       = "lambda.lambda_handler"
  runtime       = "python3.9"

  environment {
    variables = {
      EMAIL = var.email
    }
  }
}
