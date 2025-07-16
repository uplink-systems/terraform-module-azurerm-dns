## Module 'terraform-module-azurerm-dns'

### Description

This module is intended to create public DNS zones and resource record sets in Azure RM following my business needs and standards. The module only manages forward lookup zones. Reverse lookup zones incl. PTR record sets are currently not in scope of this module.  
The module is able to create a management lock on zone resource level in addition to the zone and record set resources themselves. The managment lock resource has a dependency to all other resources to initially allow the creation of the zone and all record sets before applying the lock. Once applied, the lock also affects Terraform itself even if authenticating with a Service Principal. Therefore it is best practice to remove the lock together with any further change and add the lock again afterwards.  

#### Tasks & ToDos

- [x] Create and manage a public DNS zone
- [x] Create and manage public DNS recordsets for all available record types in the DNS zone
- [ ] \(Optional) Apply input variable validation rules if necessary to match available resource values
- [ ] \(Optional) Apply input variable validation rules if necessary to match business standards
- [x] Create and manage modules outputs for DNS zones
- [x] Create and manage modules outputs for DNS recordsets
- [x] Document module with README.md
- [ ] \(Optional) Review code regularly for possible improvements and updates
  
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_azurerm"></a> [hashicorp\/azurerm](#requirement\_azurerm) | ~> 4.0 |

### Resources

| Name | Type |
|------|------|
| [azurerm_dns_zone.zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone) | resource |
| [azurerm_dns_a_record.recordset](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_a_record) | resource |
| [azurerm_dns_aaaa_record.recordset](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_aaaa_record) | resource |
| [azurerm_dns_caa_record.recordset](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_caa_record) | resource |
| [azurerm_dns_cname_record.recordset](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_cname_record) | resource |
| [azurerm_dns_mx_record.recordset](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_mx_record) | resource |
| [azurerm_dns_ns_record.recordset](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_ns_record) | resource |
| [azurerm_dns_srv_record.recordset](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_srv_record) | resource |
| [azurerm_dns_txt_record.recordset](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_txt_record) | resource |
| [azurerm_management_lock.lock](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_lock) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_zone"></a> [zone](#input\_zone) | 'var.zone' is the main variable for DNS zone's resource attributes | <pre>type        = object({<br>  name                  = string<br>  resource_group_name   = string<br>  tags                  = optional(map(string), null)<br>  management_lock       = optional(object({<br>    enabled               = optional(bool, true)<br>    name                  = optional(string, null)<br>    lock_level            = optional(string, null)<br>    notes                 = optional(string, null)<br>  }), { enabled = false })<br>})<br></pre> | none | yes |
| <a name="input_recordset_a"></a> [recordset_a](#input\_recordset\_a) | 'var.recordset_a' is the main variable for DNS zone's record set resources of record type 'A' | <pre>type         = map(object({<br>  name                = string<br>  records             = optional(list(string))<br>  target_resource_id  = optional(string)<br>  tags                = optional(map(string), null)<br>  ttl                 = optional(number, 3600)<br>}))<br></pre> | { } | no |
| <a name="input_recordset_aaaa"></a> [recordset_aaaa](#input\_recordset\_aaaa) | 'var.recordset_aaaa' is the main variable for DNS zone's record set resources of record type 'AAAA' | <pre>type        = map(object({<br>  name                = string<br>  records             = optional(list(string))<br>  target_resource_id  = optional(string)<br>  tags                = optional(map(string), null)<br>  ttl                 = optional(number, 3600)<br>}))<br></pre> | { } | no |
| <a name="input_recordset_caa"></a> [recordset_caa](#input\_recordset\_caa) | 'var.recordset_caa' is the main variable for DNS zone's record set resources of record type 'CAA' | <pre>type        = map(object({<br>  name                = string<br>  record              = optional(list(string))<br>  tags                = optional(map(string), null)<br>  ttl                 = optional(number, 3600)<br>}))<br></pre> | { } | no |
| <a name="input_recordset_cname"></a> [recordset_cname](#input\_recordset\_cname) | 'var.recordset_cname' is the main variable for DNS zone's record set resources of record type 'CNAME' | <pre>type        = map(object({<br>  name                = string<br>  record              = optional(string)<br>  target_resource_id  = optional(string)<br>  tags                = optional(map(string), null)<br>  ttl                 = optional(number, 3600)<br>}))<br></pre> | { } | no |
| <a name="input_recordset_mx"></a> [recordset_mx](#input\_recordset\_mx) | 'var.recordset_mx' is the main variable for DNS zone's record set resources of record type 'MX' | <pre>type        = map(object({<br>  name                = string<br>  record              = optional(list(string))<br>  tags                = optional(map(string), null)<br>  ttl                 = optional(number, 3600)<br>}))<br></pre> | { } | no |
| <a name="input_recordset_ns"></a> [recordset_ns](#input\_recordset\_ns) | 'var.recordset_ns' is the main variable for DNS zone's record set resources of record type 'NS' | <pre>type        = map(object({<br>  name                = string<br>  records             = optional(list(string))<br>  tags                = optional(map(string), null)<br>  ttl                 = optional(number, 172800)<br>}))<br></pre> | { } | no |
| <a name="input_recordset_srv"></a> [recordset_srv](#input\_recordset\_srv) | 'var.recordset_srv' is the main variable for DNS zone's record set resources of record type 'SRV' | <pre>type        = map(object({<br>  name                = string<br>  record              = optional(list(string))<br>  tags                = optional(map(string), null)<br>  ttl                 = optional(number, 3600)<br>}))<br></pre> | { } | no |
| <a name="input_recordset_txt"></a> [recordset_txt](#input\_recordset\_txt) | 'var.recordset_txt' is the main variable for DNS zone's record set resources of record type 'TXT' | <pre>type        = map(object({<br>  name                = string<br>  record              = optional(list(string))<br>  tags                = optional(map(string), null)<br>  ttl                 = optional(number, 3600)<br>}))<br></pre> | { } | no |
 
<details>
<summary><b>Using the variables in the root module</b></summary>

######
The following lines explain how the main variable in the root module has to be defined with minimum required settings if the module is used with a for_each loop and shall create multiple resources:  

```
variable "azurerm_dns" {
  type  = map(object({
    zone            = any
    recordset_a     = optional(any, {})
    recordset_aaaa  = optional(any, {})
    recordset_caa   = optional(any, {})
    recordset_cname = optional(any, {})
    recordset_mx    = optional(any, {})
    recordset_ns    = optional(any, {})
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
```
</details>
  
### Outputs

| Name | Description |
|------|-------------|
| <a name="output_azurerm_dns_zone"></a> [azurerm\_dns\_zone](#output\_azurerm\_dns\_zone) | list of all exported attributes values from the DNS zone |
| <a name="output_azurerm_dns_zone_id"></a> [azurerm\_dns\_zone\_id](#output\_azurerm\_dns\_zone\_) | list of exported id attribute values from the DNS zone |
| <a name="output_azurerm_dns_zone_name_servers"></a> [azurerm\_dns\_zone\_name\_servers](#output\_azurerm\_dns\_zone\_name\_servers) | list of exported name_servers attribute values from the DNS zone |
| <a name="output_azurerm_dns_zone_number_of_record_sets"></a> [azurerm\_dns\_zone\_number\_of\_record\_sets](#output\_azurerm\_dns\_zone\_number\_of\_record\_sets) | list of exported number_of_record_sets attribute values from the DNS zone |
| <a name="output_azurerm_dns_a_record"></a> [azurerm\_dns\_a\_record](#output\_azurerm\_dns\_a\_record) | list of all exported attributes values from the DNS A record set resources  |
| <a name="output_azurerm_dns_aaaa_record"></a> [azurerm\_dns\_aaaa\_record](#output\_azurerm\_dns\_aaaa\_record) | list of all exported attributes values from the DNS AAAA record set resources  |
| <a name="output_azurerm_dns_caa_record"></a> [azurerm\_dns\_caa\_record](#output\_azurerm\_dns\_caa\_record) | list of all exported attributes values from the DNS CAA record set resources  |
| <a name="output_azurerm_dns_cname_record"></a> [azurerm\_dns\_cname\_record](#output\_azurerm\_dns\_cname\_record) | list of all exported attributes values from the DNS CNAME record set resources  |
| <a name="output_azurerm_dns_mx_record"></a> [azurerm\_dns\_mx\_record](#output\_azurerm\_dns\_mx\_record) | list of all exported attributes values from the DNS MX record set resources  |
| <a name="output_azurerm_dns_ns_record"></a> [azurerm\_dns\_ns\_record](#output\_azurerm\_dns\_ns\_record) | list of all exported attributes values from the DNS NS record set resources  |
| <a name="output_azurerm_dns_soa_record"></a> [azurerm\_dns\_soa\_record](#output\_azurerm\_dns\_soa\_record) | list of all exported attributes values from the DNS SOA record set data sources  |
| <a name="output_azurerm_dns_srv_record"></a> [azurerm\_dns\_srv\_record](#output\_azurerm\_dns\_srv\_record) | list of all exported attributes values from the DNS SRV record set resources  |
| <a name="output_azurerm_dns_txt_record"></a> [azurerm\_dns\_txt\_record](#output\_azurerm\_dns\_txt\_record) | list of all exported attributes values from the DNS TXT record set resources  |
| <a name="output_azurerm_management_lock"></a> [azurerm\_management\_lock](#output\_azurerm\_management\_lock) | list of all exported attributes values from the DNS zone's management lock resources  |
  
<details>
<summary><b>Using the outputs in the root module</b></summary>

######
Output - IDs of all zones using 'azurerm_dns_zone' output:

```
output "azurerm_dns_zone_id_all_zones" {
  value = toset([
    for object_id in module.azurerm_dns : object_id.azurerm_dns_zone_id
  ])
}
```

...or directly via 'azurerm_dns_zone_id' output:

```
output "azurerm_dns_zone_id_all_zones" {
  value = values(module.azurerm_dns).*.azurerm_dns_zone_id
}
```

Output - ID of a single specified zone using 'azurerm_dns_zone_id' output:

```
output "azurerm_dns_zone_id_zone_1" {
  value = module.azurerm_dns["<i>&lt;Terraform-Resource-Name&gt;</i>"].azurerm_dns_zone_id
}
```
  
Output - Details of all nameserver record sets using 'azurerm_dns_ns_record' output:

```
output "azurerm_dns_ns_record_all_recordsets" {
    value = flatten(values(module.azurerm_dns).*.azurerm_dns_ns_record)
}
```
NOTE: use the 'flatten' function to remove unnecessary nestings caused by the module's output...
</details>
