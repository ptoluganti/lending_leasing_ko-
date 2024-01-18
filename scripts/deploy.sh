#!/bin/bash

resource_group_name='rg-bicep-demo-001'
location="northeurope"

echo "Creating resource group ${resource_group_name}"
az group create --name "${resource_group_name}" --location "${location}" &> /dev/null
az group create --name "${resource_group_name}1" --location "${location}" &> /dev/null

keys=("${resource_group_name}" "${resource_group_name}1")
for key in ${keys[@]}; do
    echo "${key}"
done


# echo "Creating deployment bicep-demo-001"
# az deployment group create --name 'bicep-demo-001' \
#     --resource-group "${resource_group_name}" \
#     --template-file main.bicep \
#     --parameters stoResourceGroupName="${resource_group_name}1"
#     #   &> /dev/null
