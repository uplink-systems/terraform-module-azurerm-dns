###################################################################################################
#   main.tf                                                                                       #
###################################################################################################

######################### DNS Zone ################################################################

resource "azurerm_dns_zone" "zone" {
  name                 = var.zone.name
  resource_group_name  = var.zone.resource_group_name
  tags                 = var.zone.tags
  depends_on           = [local.resource_group_name]
}

######################### DNS Record Sets: A ######################################################

resource "azurerm_dns_a_record" "recordset" {
  for_each            = var.recordset_a
  name                = each.value.name
  zone_name           = azurerm_dns_zone.zone.name
  resource_group_name = azurerm_dns_zone.zone.resource_group_name
  records             = each.value.records
  ttl                 = each.value.ttl
  target_resource_id  = each.value.target_resource_id
  depends_on          = [azurerm_dns_zone.zone]
}

######################### DNS Record Sets: AAAA ###################################################

resource "azurerm_dns_aaaa_record" "recordset" {
  for_each            = var.recordset_aaaa
  name                = each.value.name
  zone_name           = azurerm_dns_zone.zone.name
  resource_group_name = azurerm_dns_zone.zone.resource_group_name
  records             = each.value.records
  ttl                 = each.value.ttl
  target_resource_id  = each.value.target_resource_id
  depends_on          = [azurerm_dns_zone.zone]
}

######################### DNS Record Sets: CAA ####################################################

resource "azurerm_dns_caa_record" "recordset" {
  for_each            = var.recordset_caa
  name                = each.value.name
  zone_name           = azurerm_dns_zone.zone.name
  resource_group_name = azurerm_dns_zone.zone.resource_group_name
  dynamic "record" {
    for_each = [for record in each.value.record : record]
    content {
      flags     = split(" ", record.value)[0]
      tag       = split(" ", record.value)[1]
      value     = split(" ", record.value)[2]
    }
  }
  ttl                 = each.value.ttl
  depends_on          = [azurerm_dns_zone.zone]
}

######################### DNS Record Sets: CNAME ##################################################

resource "azurerm_dns_cname_record" "recordset" {
  for_each            = var.recordset_cname
  name                = each.value.name
  zone_name           = azurerm_dns_zone.zone.name
  resource_group_name = azurerm_dns_zone.zone.resource_group_name
  record              = each.value.record
  ttl                 = each.value.ttl
  target_resource_id  = each.value.target_resource_id
  depends_on          = [azurerm_dns_zone.zone]
}

######################### DNS Record Sets: MX #####################################################

resource "azurerm_dns_mx_record" "recordset" {
  for_each            = var.recordset_mx
  name                = each.value.name
  zone_name           = azurerm_dns_zone.zone.name
  resource_group_name = azurerm_dns_zone.zone.resource_group_name
  dynamic "record" {
    for_each = [for record in each.value.record : record]
    content {
      exchange    = split(" ", record.value)[0]
      preference  = split(" ", record.value)[1]
    }
  }
  ttl                 = each.value.ttl
  depends_on          = [azurerm_dns_zone.zone]
}

######################### DNS Record Sets: NS #####################################################

resource "azurerm_dns_ns_record" "recordset" {
  for_each            = var.recordset_ns
  name                = each.value.name
  zone_name           = azurerm_dns_zone.zone.name
  resource_group_name = azurerm_dns_zone.zone.resource_group_name
  records             = each.value.records
  ttl                 = each.value.ttl
  depends_on          = [azurerm_dns_zone.zone]
  lifecycle {
    precondition {
      # DO NOT modify the root name server record set!
      condition     = each.value.name != "@"
      error_message = <<-EOF
        The specified value for attritbute 'var.recordset_ns.name' represents the root record.
        This record is managed by Microsoft. Therefore, creating/changing the root record set
        is not  allowed for the NS record type.
      EOF
    }
  }
}

######################### DNS Record Sets: SRV ####################################################

resource "azurerm_dns_srv_record" "recordset" {
  for_each            = var.recordset_srv
  name                = each.value.name
  zone_name           = azurerm_dns_zone.zone.name
  resource_group_name = azurerm_dns_zone.zone.resource_group_name
  dynamic "record" {
    for_each = [for record in each.value.record : record]
    content {
      port        = split(" ", record.value)[0]
      priority    = split(" ", record.value)[1]
      target      = split(" ", record.value)[2]
      weight      = split(" ", record.value)[3]
    }
  }
  ttl                 = each.value.ttl
  depends_on          = [azurerm_dns_zone.zone]
}

######################### DNS Record Sets: TXT ####################################################

resource "azurerm_dns_txt_record" "recordset" {
  for_each            = var.recordset_txt
  name                = each.value.name
  zone_name           = azurerm_dns_zone.zone.name
  resource_group_name = azurerm_dns_zone.zone.resource_group_name
  dynamic "record" {
    for_each = [for record in each.value.record : record]
    content {
        value     = record.value
      }
  }
  ttl                 = each.value.ttl
  depends_on          = [azurerm_dns_zone.zone]
}
