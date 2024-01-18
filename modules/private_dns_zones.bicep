@description('Private DNS zone name')
param privateDnsZoneName string
// @description('VNet name')
// param vnetName string = 'VNet'

// @description('VNet Address prefix')
// param vnetAddressPrefix string = '10.0.0.0/16'

// @description('Subnet Prefix')
// param subnetPrefix string = '10.0.0.0/24'

// @description('Subnet Name')
// param subnetName string = 'App'

// @description('Location for all resources.')
// param location string = resourceGroup().location



resource privateDnsZone 'Microsoft.Network/privateDnsZones@2020-06-01' = {
  name: privateDnsZoneName
  location: 'global'
}

// resource privateDnsZoneLink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = {
//   parent: privateDnsZone
//   name: '${vnetName}-link'
//   location: 'global'
//   properties: {
//     virtualNetwork: {
//       id: vnet_id
//     }
//   }
// }
