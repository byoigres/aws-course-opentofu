variable "environment" {
  type = string
}

variable "stage" {
  type = string
}

variable "region" {
  type = string
}

variable "account_id" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "availability_zone" {
  type    = string
  default = "us-west-2a"
}

variable "blueprint_id" {
  type    = string
  default = "ubuntu_22_04"
}

variable "bundle_id" {
  type    = string
  default = "small_3_0"
}
