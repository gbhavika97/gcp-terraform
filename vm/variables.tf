variable "credentials" {
    default = "C:/Users/bavik/Documents/serviceacc.json"
}
variable "project_id" {
    default = "studious-spider-371813"
}
variable "region" {
    default = "us-west4"
}
variable "zone" {
    default = "us-west4-a"
}
variable "vpc-name" {
    default = "myvpc1"
}
variable "subnet" {
    default = "mysubnet-1"
}
variable "ip_cidr_range" {
    default = "10.10.0.0/24"
}
variable "vm-name" {
    default = "vm-1"
  
}
variable "machine_type" {
    default = "f1-micro"
}
variable "image" {
    default = "debian-cloud/debian-11"
}
variable "vm_static_ip" {
    default = "demo-static-ip-west"
}