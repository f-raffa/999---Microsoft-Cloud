Clear-Host
write-host "Starting script at $(Get-Date)"
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-Module -Name Az.Synapse -Force


# $resourceGroupName = "synapse-labs"

$resourceGroupName = "dp203-lab1"

$Region = "westeurope"

$dataLakeAccountName = "datalake7uoqxmd"
$containerName = "tests-and-learn"

Write-Host "Creating $resourceGroupName resource group in $Region ..."
New-AzResourceGroup -Name $resourceGroupName -Location $Region | Out-Null


write-host "Initializing the Quotas and Limits Storage Account Container with the following parameters:"
write-host " resourceGroupName= $resourceGroupName"
write-host " dataLakeAccountName= $dataLakeAccountName"
write-host " suffix= $suffix"
write-host "(This may take some time!)"
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName `
  -TemplateFile "storage_container_arm.json" `
  -Mode Complete `
  -dataLakeAccountName $dataLakeAccountName `
  -containerName $containerName `
  -Force


# Upload files
write-host "Loading data..."
$storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $dataLakeAccountName
$storageContext = $storageAccount.Context

$quotas_data_file_name = "quotas_and_limits.json"

$upload_file = Get-ChildItem $quotas_data_file_name -File

$blobPath = "001_quotas_and_limits/$quotas_data_file_name"
Set-AzStorageBlobContent -File $upload_file.FullName -Container $containerName -Blob $blobPath -Context $storageContext
