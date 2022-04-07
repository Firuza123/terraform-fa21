

# I am creating dev user
resource "aws_iam_user" "dev-user" {
  name = "Rumiy"
}
resource "aws_iam_user" "dev-user2" {
  name = "Navoiy"
}
# I am creating IAM group
resource "aws_iam_group" "developers" {
  name = "developers"
}
#I am trying to add users to group
resource "aws_iam_group_membership" "developers-attachment" {
  name = "attaching-users-to-group"

  users = [
    aws_iam_user.dev-user.name,
    aws_iam_user.dev-user2.name,
  ]

  group = aws_iam_group.developers.name
}


# policy attachment to group
resource "aws_iam_policy_attachment" "test-attach" {
  name       = "test-attachment"
  groups     = [aws_iam_group.developers.name]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
