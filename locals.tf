###################################################################################################
#   locals.tf                                                                                     #
###################################################################################################

locals {
  resource_group_name   = var.zone.resource_group_name
  zone                  = {
    management_lock       = {
      lock_level            = var.zone.management_lock.lock_level == null ? "CanNotDelete" : var.zone.management_lock.lock_level
    }
  }
}
