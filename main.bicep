@description('An array that contains objects with preoperties for the private dns zones, For format see default.yml.')
param private_dns_zones array = []


module pdns 'modules/private_dns_zones.bicep' = [ for pdns in private_dns_zones: {
  name: pdns.name
}]
