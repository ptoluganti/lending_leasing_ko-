#!/bin/bash

resource_group_name='rg-bicep-demo-001'
location="northeurope"

echo "Creating resource group ${resource_group_name}"
az group create --name "${resource_group_name}" --location "${location}" &> /dev/null

echo "Creating deployment bicep-demo-001"
az deployment group create --name 'bicep-demo-001' \
    --resource-group "${resource_group_name}" \
    --template-file main.bicep \
    --parameters location="${location}"  &> /dev/null
