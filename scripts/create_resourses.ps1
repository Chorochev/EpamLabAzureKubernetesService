$environment = "dev"
$location = "eastus" # "East US" #"eastasia"
$workload = "kubernetesEpamLab"
$instance = "001"
$resourceGroupName = "rg-$workload-$environment-$location-$instance"

Write-Host "Create a resource group: $resourceGroupName" -Foreground Green

# Create a resource group.
az group create --name $resourceGroupName --location "$location"
