variable "rg_name" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "Location"
  default     = "uksouth"
  type        = string
}

variable "extra_tags" {
  description = "Extra tags to be applied to the created resources"
  default     = {}
  type        = map(any)
}
