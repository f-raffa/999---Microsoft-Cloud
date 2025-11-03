# Connect-AzAccount -TenantId "bfcc27e6-aeae-460b-a71c-0e532f5d2555" -Subscription "010b2eb9-a8b8-48b5-a0d9-f0a65850eab0" -UseDeviceAuthentication   # Personal

# Connect-AzAccount -TenantId "203fd445-2bc2-4a4c-93b4-df007cf1dd40" -Subscription "2cb0b54b-87b9-4ac2-bf54-792a6d303a34" -UseDeviceAuthentication   # IXM


# Variabili
$sourceResourceGroupName = "Synapse-Data-Platform-RG"
$sourceStorageAccount = "synapsedataptfrmstacct"
$sourceContainer = "aquarius-refined"


$destinationResourceGroupName = "Synapse-Warehouse-RG"
$destStorageAccount = "synapsewarehousestorage"
$destContainer = "000-raw"


# Crea contesti
$sourceContext = (Get-AzStorageAccount -ResourceGroupName $sourceResourceGroupName -Name $sourceStorageAccount).context
$destContext = (Get-AzStorageAccount -ResourceGroupName $destinationResourceGroupName -Name $destStorageAccount).context



Get-AzDataLakeGen2ChildItem -Context $sourceContext -FileSystem "$sourceContainer" -Path "FullSnapshot/" -recurse | Foreach-Object {
    $remotePath = $_.Name
    $file_name_split = $remotePath -match 'dbo\.(.*?)_(\d{4})-(\d{2})-(\d{2})T(.*?)\+00.*?\.json'
    $file_name = $Matches[0]
    $tableName = $Matches[1]
    $year = $Matches[2]
    $month = $Matches[3]
    $day = $Matches[4]
    $time_of_the_day = $Matches[5]
    if ($tableName -eq 'LDC_SECURITY_USERS_REGION_OFFICE') {
        $destinationFilePath = "aquarius_ldcustom/$remotePath".replace('FullSnapshot', 'full-snapshot')

        #$localFile = "$year/$month/$file_name"
        #Start-AzStorageBlobCopy -SrcBlob $sourceBlob -SrcContainer $sourceContainer -Context $destContext -SrcContext $sourceContext -DestContainer $destContainer
    } else {
        $destinationFilePath = "aquarius_refined/$remotePath".replace('FullSnapshot', 'full-snapshot')
    }

    Write-Host "$remotePath -> $destinationFilePath"

    Start-AzStorageBlobCopy `
     -SrcBlob $remotePath `
     -SrcContainer $sourceContainer `
     -DestContainer $destContainer `
     -DestBlob $destinationFilePath `
     -SrcContext $sourceContext `
     -DestContext $destContext -Force
}






Get-AzDataLakeGen2ChildItem -Context $sourceContext -FileSystem "$sourceContainer" -Path "Incremental/" -recurse | Foreach-Object {
    $remotePath = $_.Name
    $file_name_split = $remotePath -match 'dbo\.(.*?)_(\d{4})-(\d{2})-(\d{2})T(.*?)\+00.*?\.json'
    $file_name = $Matches[0]
    $tableName = $Matches[1]
    $year = $Matches[2]
    $month = $Matches[3]
    $day = $Matches[4]
    $time_of_the_day = $Matches[5]
    if ($tableName -eq 'LDC_SECURITY_USERS_REGION_OFFICE') {
        $destinationFilePath = "aquarius_ldcustom/$remotePath".replace('Incremental', 'incremental')

        #$localFile = "$year/$month/$file_name"
        #Start-AzStorageBlobCopy -SrcBlob $sourceBlob -SrcContainer $sourceContainer -Context $destContext -SrcContext $sourceContext -DestContainer $destContainer
    } else {
        $destinationFilePath = "aquarius_refined/$remotePath".replace('Incremental', 'incremental')
    }

    Write-Host "$remotePath -> $destinationFilePath"

    Start-AzStorageBlobCopy `
     -SrcBlob $remotePath `
     -SrcContainer $sourceContainer `
     -DestContainer $destContainer `
     -DestBlob $destinationFilePath `
     -SrcContext $sourceContext `
     -DestContext $destContext -Force
}