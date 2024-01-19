@description('Specifies the name of the key vault.')
param keyVaultName string

@description('Specifies the Azure location where the key vault should be created.')
param location string = resourceGroup().location

@description('Specifies the Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. Get it by using Get-AzSubscription cmdlet.')
param tenantId string = subscription().tenantId

resource kv 'Microsoft.KeyVault/vaults@2023-07-01' = {
  name: keyVaultName
  location: location
  properties: {
    enabledForDeployment: true
    enabledForTemplateDeployment: true
    enabledForDiskEncryption: true
    enablePurgeProtection: true
    enableRbacAuthorization: true
    publicNetworkAccess: 'Disabled'
    sku: {
      name: 'premium'
      family: 'A'
    }
    tenantId: tenantId
    networkAcls: {
      defaultAction: 'Deny'
      bypass: 'AzureServices'
    }
  }
}

resource infraKeys 'Microsoft.KeyVault/vaults/keys@2023-07-01' = [for keyName in [ 'databricks-key', 'storage-key' ]: {
  parent: kv
  name: keyName
  properties: {
    kty: 'RSA-HSM'
    keySize: 2048
    rotationPolicy: {
      attributes: {
        expiryTime: 'P2Y'
      }
    }
  }
}]
