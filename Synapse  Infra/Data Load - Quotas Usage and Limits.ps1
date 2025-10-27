write-host "Starting script at $(Get-Date)"

$resourceGroupName = "Synapse-AllLabs-RG"

$uniqueSuffix = Get-Content "000 - DeploymentSuffix.txt"

$dataLakeAccountName = "datalake$uniqueSuffix"
$containerName = "tests-and-learn"


# Upload files
write-host "Loading data..."
$storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $dataLakeAccountName
$storageContext = $storageAccount.Context

$quotas_data_file_name = "Quotas Usage and Limits - Data.json"
$blobPath = "001_quotas/$quotas_data_file_name"

$upload_file = Get-Item -Path $quotas_data_file_name
$quotas_data_file_name = $upload_file.FullName

Set-AzStorageBlobContent -File $quotas_data_file_name -Container $containerName -Blob $blobPath -Context $storageContext
