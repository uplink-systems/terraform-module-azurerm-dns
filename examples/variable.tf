####################################################################################################
#   variable.tf                                                                                    #
####################################################################################################

variable "tenant_id" {
  description = "Tenant ID to manage via Terraform"
  type        = string
  default     = "yourTenantId"
}
