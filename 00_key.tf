resource "aws_key_pair" "id_rsa" {
  key_name = "id_rsa"
  public_key = file("C:/.ssh/id_rsa.pub")
}