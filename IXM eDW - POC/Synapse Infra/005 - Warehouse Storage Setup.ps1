# Clear-Host
write-host "Starting script at $(Get-Date)"

$resourceGroupName = "Synapse-Warehouse-RG"

# Create Synapse workspace
$synapseWorkspace = "synapse-warehouse-ws"
$dataLakeAccountName = "synapsewarehousestorage"
$resourceGroup = Get-AzResourceGroup -Name $resourceGroupName
$location = $resourceGroup.Location

[string]$suffix =  -join ((48..57) + (97..122) | Get-Random -Count 7 | % {[char]$_})

Write-Host "Creating warehouse storage account in $resourceGroupName with the following parameters:"
write-host " resourceGroupName= $resourceGroupName"
write-host " synapseWorkspace= $synapseWorkspace"
write-host " dataLakeAccountName= $dataLakeAccountName"
write-host " location= $location"
write-host "(This may take some time!)"
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName `
  -Name "synapse-workspace-deployment-$suffix" `
  -TemplateFile "006 - Warehouse Storage Setup.json" `
  -Mode Incremental `
  -workspaceName $synapseWorkspace `
  -dataLakeAccountName $dataLakeAccountName `
  -location $location `
  -ErrorAction SilentlyContinue

write-host "Granting permissions on the $dataLakeAccountName storage account..."
write-host "(you can ignore any warnings!)"
$subscriptionId = (Get-AzContext).Subscription.Id
$userName = ((az ad signed-in-user show) | ConvertFrom-JSON).UserPrincipalName

#$id = (Get-AzADServicePrincipal -DisplayName $synapseWorkspace).id
#New-AzRoleAssignment -Objectid $id -RoleDefinitionName "Storage Blob Data Owner" -Scope "/subscriptions/$subscriptionId/resourceGroups/$resourceGroupName/providers/Microsoft.Storage/storageAccounts/$dataLakeAccountName" -ErrorAction SilentlyContinue;
New-AzRoleAssignment -SignInName $userName -RoleDefinitionName "Storage Blob Data Owner" -Scope "/subscriptions/$subscriptionId/resourceGroups/$resourceGroupName/providers/Microsoft.Storage/storageAccounts/$dataLakeAccountName" -ErrorAction SilentlyContinue;


$storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $dataLakeAccountName
$storageContext = $storageAccount.Context


New-AzDataLakeGen2Item -Context $storageContext -FileSystem "000-raw" -Path "aquarius_ldcustom/full_snapshot" -Directory -ErrorAction SilentlyContinue
New-AzDataLakeGen2Item -Context $storageContext -FileSystem "000-raw" -Path "aquarius_ldcustom/incremental" -Directory -ErrorAction SilentlyContinue
New-AzDataLakeGen2Item -Context $storageContext -FileSystem "000-raw" -Path "aquarius_refined/full_snapshot" -Directory -ErrorAction SilentlyContinue
New-AzDataLakeGen2Item -Context $storageContext -FileSystem "000-raw" -Path "aquarius_refined/incremental" -Directory -ErrorAction SilentlyContinue


New-AzDataLakeGen2Item -Context $storageContext -FileSystem "005-staging" -Path "aquarius_ldcustom_landing.db" -Directory -ErrorAction SilentlyContinue
New-AzDataLakeGen2Item -Context $storageContext -FileSystem "005-staging" -Path "aquarius_ldcustom_staging.db" -Directory -ErrorAction SilentlyContinue
New-AzDataLakeGen2Item -Context $storageContext -FileSystem "005-staging" -Path "aquarius_refined_landing.db" -Directory -ErrorAction SilentlyContinue
New-AzDataLakeGen2Item -Context $storageContext -FileSystem "005-staging" -Path "aquarius_refined_staging.db" -Directory -ErrorAction SilentlyContinue


New-AzDataLakeGen2Item -Context $storageContext -FileSystem "010-core" -Path "core_staging.db" -Directory -ErrorAction SilentlyContinue
New-AzDataLakeGen2Item -Context $storageContext -FileSystem "010-core" -Path "core_vault.db" -Directory -ErrorAction SilentlyContinue
New-AzDataLakeGen2Item -Context $storageContext -FileSystem "010-core" -Path "core_vault_enriched.db" -Directory -ErrorAction SilentlyContinue


New-AzDataLakeGen2Item -Context $storageContext -FileSystem "015-consumption" -Path "consumption.db" -Directory -ErrorAction SilentlyContinue


write-host "Script completed at $(Get-Date)"
