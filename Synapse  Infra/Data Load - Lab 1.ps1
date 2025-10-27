write-host "Starting script at $(Get-Date)"

# Create Synapse workspace
$synapseWorkspace = "synapse-all-labs-ws"
$dataLakeAccountName = "datalake$suffix"
$sqlDatabaseName = "sqlpool"
$sqlUser = "SQLUser"
$sqlPassword = 'llBRUT$5000'

# Load data
write-host "Loading data..."
Get-ChildItem "./Lab 1 - Data/*.txt" -File | Foreach-Object {
    write-host ""
    $file = $_.FullName
    Write-Host "$file"
    $table = $_.Name.Replace(".txt","")
    bcp dbo.$table in $file -S "$synapseWorkspace.sql.azuresynapse.net" -U $sqlUser -P $sqlPassword -d $sqlDatabaseName -f $file.Replace("txt", "fmt") -q -k -E -b 5000
}

# Pause SQL Pool
write-host "Pausing the $sqlDatabaseName SQL Pool..."
Suspend-AzSynapseSqlPool -WorkspaceName $synapseWorkspace -Name $sqlDatabaseName -AsJob

# Upload files
write-host "Loading data..."
$storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $dataLakeAccountName
$storageContext = $storageAccount.Context
Get-ChildItem "./Lab 1 - Files/*.csv" -File | Foreach-Object {
    write-host ""
    $file = $_.Name
    Write-Host $file
    $blobPath = "sales_data/$file"
    Set-AzStorageBlobContent -File $_.FullName -Container "files" -Blob $blobPath -Context $storageContext
}

# Create KQL script
# Removing until fix for Bad Request error is resolved
# New-AzSynapseKqlScript -WorkspaceName $synapseWorkspace -DefinitionFile "./files/ingest-data.kql"

write-host "Script completed at $(Get-Date)"
