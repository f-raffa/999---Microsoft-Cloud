Clear-Host
write-host "Starting script at $(Get-Date)"


$resourceGroupName = "Synapse-AllLabs-RG"

$uniqueSuffix = Get-Content "000 - DeploymentSuffix.txt"
$dataLakeAccountName = "datalake$uniqueSuffix"


# Upload files
write-host "Loading data..."
$storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $dataLakeAccountName
$storageContext = $storageAccount.Context
Get-ChildItem "./Lab 2 - Data/*.csv" -File | Foreach-Object {
    write-host ""
    $file = $_.Name
    Write-Host $file
    $blobPath = "sales/csv/$file"
    Set-AzStorageBlobContent -File $_.FullName -Container "files" -Blob $blobPath -Context $storageContext
}

Get-ChildItem "./Lab 2 - Data/*.parquet" -File | Foreach-Object {
    write-host ""
    Write-Host $_.Name
    $folder = $_.Name.Replace(".snappy.parquet", "")
    $file = $_.Name.Replace($folder, "orders")
    $blobPath = "sales/parquet/year=$folder/$file"
    Set-AzStorageBlobContent -File $_.FullName -Container "files" -Blob $blobPath -Context $storageContext
}

Get-ChildItem "./Lab 2 - Data/*.json" -File | Foreach-Object {
    write-host ""
    $file = $_.Name
    Write-Host $file
    $blobPath = "sales/json/$file"
    Set-AzStorageBlobContent -File $_.FullName -Container "files" -Blob $blobPath -Context $storageContext
}

write-host "Script completed at $(Get-Date)"
