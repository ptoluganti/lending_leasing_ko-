@description('Storage Account type')
param storageAccountType string = 'Standard_LRS'

@description('The storage account location.')
param location string = resourceGroup().location

@description('The name of the storage account')
param storageAccountName string = 'st${uniqueString(resourceGroup().id)}'

resource sa 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  sku: {
    name: storageAccountType
  }
  tags: {
    'databricks-environment': 'true'
  }
  kind: 'StorageV2'
  properties: {
    minimumTlsVersion: 'TLS1_2'
    publicNetworkAccess: 'Disabled'
    encryption: {
      requireInfrastructureEncryption: true
    }
    networkAcls:{
      defaultAction: 'Deny'
      bypass: 'AzureServices'
    }
  }
}
