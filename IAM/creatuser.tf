# Create IAM users
resource "aws_iam_user" "dev-users" {
  count = "${length(var.dev-users)}"
  name = "${element(var.dev-users,count.index )}"
  }
# Create IAM users
resource "aws_iam_user" "test-users" {
  count = "${length(var.test-users)}"
  name = "${element(var.test-users,count.index )}"
}

# Create IAM users
resource "aws_iam_user" "prod-users" {
  count = "${length(var.prod-users)}"
  name = "${element(var.prod-users,count.index )}"
}

# Create IAM group
resource "aws_iam_group" "a" {
  name = var.dev-group
}

# Create IAM group
resource "aws_iam_group" "b" {
  name = var.test-group
}

# Create IAM group
resource "aws_iam_group" "c" {
  name = var.prod-group
}

# Assign users to the group
resource "aws_iam_group_membership" "Developers" {
    name = "Developers"
    count = length(var.dev-users)
    users = [
      element(aws_iam_user.dev-users.*.name, count.index)
      ]
  group = aws_iam_group.a.name
}

# Assign users to the group
resource "aws_iam_group_membership" "Testers" {
    name = "Testers"
    count = length(var.test-users)
    users = [
      element(aws_iam_user.test-users.*.name, count.index)
      ]
  group = aws_iam_group.b.name
}

# Assign users to the group
resource "aws_iam_group_membership" "Productions" {
    name = "Productions"
    count = length(var.prod-users)
    users = [
      element(aws_iam_user.prod-users.*.name, count.index)
      ]
  group = aws_iam_group.c.name
}