

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
