module "ec2_instance" {
  source = "../ec2-module"

  ami           = "ami-02dfbd4ff395f2a1b"
  instance_type = "t2.micro"
}