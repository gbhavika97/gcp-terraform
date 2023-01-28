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
variable "machine_type" {
    default = "f1-micro"
}
variable "name" {
    default = "web-group"
}
variable "minimum_vm_size" {
    default = "2"
}
variable "autoscaler-name" {
    default = "web-autoscaling"
}
variable "backend-service-name" {
    default = "web-backend"
}
variable "domain-name" {
    default = "sslcert.tf-test.club."
  
}