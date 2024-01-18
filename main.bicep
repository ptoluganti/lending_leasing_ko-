@description('An array that contains objects with preoperties for the private dns zones, For format see default.yml.')
param private_dns_zones array = []

@description('An array that contains objects with preoperties for the keyvaults.')
param key_vaults array = []

@description('')
param coreResourceGroupName string

module pdns 'modules/private_dns_zones.bicep' = [for pdns in private_dns_zones: {
  name: '${pdns.name}-deploy'

  params: {
    privateDnsZoneName: pdns.name
  }
}]

module sto 'modules/storage_account.bicep' = {
  name: 'sto-tfstate-deploy'
  scope: resourceGroup(coreResourceGroupName)
  params: {
    // location: resourceGroup().location
  }
}

module kvs 'modules/keyvault.bicep' = [for kvName in key_vaults: {
  name: 'kv-deploy'
  scope: resourceGroup(coreResourceGroupName)
  params: {
    keyVaultName: kvName
  }
}]
