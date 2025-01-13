####################################################################################################
#   main.tf                                                                                        #
####################################################################################################

variable "azurerm_dns" {
  description = "Azure RM DNS settings for zones and record sets"
  type = map(object({
    zone            = any
    recordset_a     = optional(any, {})
    recordset_aaaa  = optional(any, {})
    recordset_caa   = optional(any, {})
    recordset_cname = optional(any, {})
    recordset_mx    = optional(any, {})
    recordset_ns    = optional(any, {})
    recordset_ptr   = optional(any, {})
    recordset_srv   = optional(any, {})
    recordset_txt   = optional(any, {})
  }))
}

module "azurerm_dns" {
  source            = "github.com/uplink-systems/terraform-module-azurerm-dns"
  for_each          = var.azurerm_dns
  zone              = each.value.zone
  recordset_a       = each.value.recordset_a
  recordset_aaaa    = each.value.recordset_aaaa
  recordset_caa     = each.value.recordset_caa
  recordset_cname   = each.value.recordset_cname
  recordset_mx      = each.value.recordset_mx
  recordset_ns      = each.value.recordset_ns
  recordset_srv     = each.value.recordset_srv
  recordset_txt     = each.value.recordset_txt
}
