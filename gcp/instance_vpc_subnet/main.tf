provider "google" {
  credentials                       = file(var.key_file)
  project                           = var.project_name
  region                            = var.region
  zone                              = var.zone
}

module "vpc" {
  source                            = "github.com/luizgmgomes/tf-modules/gcp/vpc/"
  name                              = var.vpc_name
  auto_create_subnetworks           = var.auto_create_subnetworks
}


module "subnet" {
  source                            = "github.com/luizgmgomes/tf-modules/gcp/subnet/"

  subnet_name                       = var.subnet_name
  ip_cidr_range                     = var.ip_cidr_range
  region                            = var.region
  network                           = module.vpc.self_link
  secondary_range_name              = var.secondary_range_name
  secondary_services_cidr_range     = var.secondary_services_cidr_range
}


module "sonarqube_instance" {
  source                            = "github.com/luizgmgomes/tf-modules/gcp/instance/"
  
  instance_name                     = var.instance_name
  machine_type                      = var.machine_type
  zone                              = var.zone
  image                             = var.image
  subnetwork                        = module.subnet.self_link
}

