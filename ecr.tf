resource "aws_ecr_repository" "cardinal_ecr" {
  name                 = "cardinal_ecr"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}