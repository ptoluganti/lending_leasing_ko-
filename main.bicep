@description('An array that contains objects with preoperties for the private dns zones, For format see default.yml.')
param private_dns_zones array = []

@description('')
param stoResourceGroupName string

module pdns 'modules/private_dns_zones.bicep' = [for pdns in private_dns_zones: {
  name: '${pdns.name}-deploy'

  params: {
    privateDnsZoneName: pdns.name
  }
}]

module sto 'modules/storage_account.bicep' = {
  name: 'sto-tfstate-deploy'
  scope: resourceGroup(stoResourceGroupName)
  params: {
    // location: resourceGroup().location
  }
}
