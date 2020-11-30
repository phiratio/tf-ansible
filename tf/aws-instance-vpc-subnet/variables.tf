// variable declarations in file with this name gets loaded automatically
variable "instance_type" {
  type = "string"
}

variable "instance_tags" {
  type = object({
    Name = string
    Priority = string
  })
}