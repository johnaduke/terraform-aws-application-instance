variable "public_ssh_key" {
  description = "Public ssh key"
  default     = "null"
}
variable "instance_ami" {
  description = "AMI for aws EC2 instance"
  default     = "ami-0c2b8ca1dad447f8a"
}
variable "instance_type" {
  description = "type for aws EC2 instance"
  default     = "t2.micro"
}
variable "environment_tag" {
  description = "Environment tag"
  default     = "Production"
}
variable "instance_name" {
  description = "EC2 Instance Name"
  default = "Terraform Instance"
}
variable "instance_count" {
  description = "Number of Application Instances"
  default = "1"
}
variable "public_subnet_id" {
  description = "The public Subnet for the Instanxe to launch in"
  default = "module.vpc.public_subnets.id"
}
variable "vpc_id" {
  default = "module.vpc.vpc_id.id"
}