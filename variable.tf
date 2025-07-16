###################################################################################################
#   variables.tf                                                                                  #
###################################################################################################

variable "zone" {
  description = "DNS zone's settings: name in FQDN format, resource group name & (optional) tags as mappings"
  nullable    = false
  type        = object({
    name                  = string
    resource_group_name   = string
    tags                  = optional(map(string), null)
    management_lock       = optional(object({
      enabled               = optional(bool, true)
      name                  = optional(string, null)
      lock_level            = optional(string, null)
      notes                 = optional(string, null)
    }), { enabled = false })
  })
  validation {
    condition     = var.zone.management_lock.lock_level == null ? true : contains(["CanNotDelete", "ReadOnly"], var.zone.management_lock.lock_level)
    error_message = <<-EOF
      Variable attribute 'var.zone.management_lock.lock_level' has an invalid value: ${var.zone.management_lock.lock_level == null ? 0 : var.zone.management_lock.lock_level}
      Value must be one of:
        "CanNotDelete", "ReadOnly" or null
    EOF
  }
}

variable "recordset_a" {
  description = "DNS zone's record set resources of record type 'A'"
  type         = map(object({
    name                = string
    records             = optional(list(string))
    target_resource_id  = optional(string)
    tags                = optional(map(string), null)
    ttl                 = optional(number, 3600)
  }))
  default     = {}
}

variable "recordset_aaaa" {
  description = "DNS zone's record set resources of record type 'AAAA'"
  type        = map(object({
    name                = string
    records             = optional(list(string))
    target_resource_id  = optional(string)
    tags                = optional(map(string), null)
    ttl                 = optional(number, 3600)
  }))
  default     = {}
}

variable "recordset_caa" {
  description = "DNS zone's record set resources of record type 'CAA'"
  type        = map(object({
    name                = string
    record              = optional(list(string))
    tags                = optional(map(string), null)
    ttl                 = optional(number, 3600)
  }))
  default     = {}
}

variable "recordset_cname" {
  description = "DNS zone's record set resources of record type 'CNAME'"
  type        = map(object({
    name                = string
    record              = optional(string)
    target_resource_id  = optional(string)
    tags                = optional(map(string), null)
    ttl                 = optional(number, 3600)
  }))
  default     = {}
}

variable "recordset_mx" {
  description = "DNS zone's record set resources of record type 'MX'"
  type        = map(object({
    name                = string
    record              = optional(list(string))
    tags                = optional(map(string), null)
    ttl                 = optional(number, 3600)
  }))
  default     = {}
}

variable "recordset_ns" {
  description = "DNS zone's record set resources of record type 'NS'"
  type        = map(object({
    name                = string
    records             = optional(list(string))
    tags                = optional(map(string), null)
    ttl                 = optional(number, 172800)
  }))
  default     = {}
}

variable "recordset_srv" {
  description = "DNS zone's record set resources of record type 'SRV'"
  type        = map(object({
    name                = string
    record              = optional(list(string))
    tags                = optional(map(string), null)
    ttl                 = optional(number, 3600)
  }))
  default     = {}
}

variable "recordset_txt" {
  description = "DNS zone's record set resources of record type 'TXT'"
  type        = map(object({
    name                = string
    record              = optional(list(string))
    tags                = optional(map(string), null)
    ttl                 = optional(number, 3600)
  }))
  default     = {}
}
