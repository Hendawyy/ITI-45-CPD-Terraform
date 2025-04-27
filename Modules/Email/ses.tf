resource "aws_ses_email_identity" "verify_email" {
  email = var.email
}
