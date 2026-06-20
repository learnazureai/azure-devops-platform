variable "nsg_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "rules" {
  type = list(object({
    name            = string
    port            = number
    priority_offset = number
  }))
}
