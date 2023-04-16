resource "aws_instance" "EC2_public" {
  ami               = var.ec_ami
  instance_type     = "t2.micro"
  subnet_id         = var.networking_var_public_subnet
  availability_zone = "us-east-1a"
  user_data         = file("/home/ec2-user/environment/lab_3/compute/apache.sh")
  key_name          = "LukaVMKey"
  tags              = { Name = "EC2_public" }
}

resource "aws_instance" "EC2_private" {
  ami               = var.ec_ami
  instance_type     = "t2.micro"
  subnet_id         = var.networking_var_private_subnet
  availability_zone = "us-east-1b"
  user_data         = file("/home/ec2-user/environment/lab_3/compute/apache.sh")
  key_name          = "LukaVMKey"
  tags              = { Name = "EC2_public" }
}
