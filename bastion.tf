resource "aws_instance" "bastion" {
  instance_type     = "t3.small"
  availability_zone = element(data.aws_availability_zones.available.names, 0)
  subnet_id = element(module.vpc.public_subnets, 0)
  ami = "ami-02d0b1ffa5f16402d"
  associate_public_ip_address = "true"
  

}