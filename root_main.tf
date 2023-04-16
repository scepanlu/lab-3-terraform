module "networking" {
  source         = "./networking"
  aws_region     = "us-east-1"
  vpc_name       = "tf-vpc"
  azs_public     = "us-east-1a"
  azs_private    = "us-east-1b"
  address_space  = "10.1.0.0/16"
  public_subnet  = "10.1.1.0/24"
  private_subnet = "10.1.2.0/24"
}

module "compute" {
  source                        = "./compute"
  ec_ami                        = "ami-00c39f71452c08778"
  networking_var_public_subnet  = module.networking.public_subnet_id
  networking_var_private_subnet = module.networking.private_subnet_id
}
