############
# Provider # 
############

variable "region" {
  default                   = "europe-west2"
}

variable "zone" {
  default                   = "europe-west2-c"
}

variable "project_name" {
  description               = "The ID of the Google Cloud project"
  default                   = "<XXXX>"
}

variable "key_file" {
  type                      = string
  description               = "JSON Credentials file"
}



###########
# Network #
###########

variable "vpc_name" {
    type                    = string
    default                 = "example-network"
}

variable "auto_create_subnetworks" {
    type                    = bool
    default                 = false
}



##############
# Subnetwork #
##############

variable "subnet_name" {
    type                    = string
    default                 = "example-subnet"
}

variable "ip_cidr_range" {
    type                    = string
    default                 = "10.0.0.0/16"
    description             = "Primary IP Range for subnetwork"
}

variable "secondary_range_name" {
    type                    = string
    default                 = "spare-example-subnet"
}

variable "secondary_services_cidr_range" {
    type                    = string
    default                 = "192.168.0.0/24"
    description             = "Secondary IP Range for subnetwork"
}


############
# Instance #
############

variable "instance_name" {
  default                   = "example-instance"
}

variable "machine_type" {
    default                 = "n1-standard-1"
}

variable "image" {
    type                    = string
    default                 = "debian-cloud/debian-9"
}
