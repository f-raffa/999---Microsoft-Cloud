Connect-AzAccount -Tenant "bfcc27e6-aeae-460b-a71c-0e532f5d2555" -Subscription "010b2eb9-a8b8-48b5-a0d9-f0a65850eab0" -UseDeviceAuthentication   # Personal

Connect-AzAccount -Tenant "203fd445-2bc2-4a4c-93b4-df007cf1dd40" -Subscription "2cb0b54b-87b9-4ac2-bf54-792a6d303a34" -UseDeviceAuthentication   # IXM


$resourceGroupName = "rg-ingestion-ixm-dev"
$dataLakeAccountName = "staqrdev"
$containerName = "raw"

$storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $dataLakeAccountName
$storageContext = $storageAccount.Context





$months = (
    '09',  # 23650 MB
    '10'   # 19940 MB
)

foreach ($month in $months) {
    $file_number = 0
    $total_storage_volume = 0
    Get-AzDataLakeGen2ChildItem -Context $storageContext -FileSystem $containerName -Path "2025/$month/" -recurse | Where-Object { -not $_.IsDirectory -and $_.Name -like "*.csv.gz" } | Foreach-Object {
        $remotePath = $_.Name
        $file_name_split = $remotePath -match 'dbo\.(.*?)_(\d{4})-(\d{2})-(\d{2})T(.*?)\+00\.csv\.gz'
        $file_name = $Matches[0]
        $tableName = $Matches[1]
        $year = $Matches[2]
        $month = $Matches[3]
        $day = $Matches[4]
        $time_of_the_day = $Matches[5]
        if ($tableName -eq 'Contracts') {
            $file_storage_volume = [int]([int]$_.Length/(1024*1024))
            $total_storage_volume = $total_storage_volume + $file_storage_volume
            $file_number = $file_number + 1
		
		    $localFile = "$year/$month/$file_name"
		    Get-AzDataLakeGen2ItemContent -Context $storageContext -FileSystem $containerName -Path $remotePath -Destination $localFile -Force
		
            Write-Host "$remotePath ${time_of_the_day}: $tableName $file_storage_volume MB"
        }
    }
    Write-Host "$file_number for a total of $total_storage_volume MB"
}



$table_dependacies_list = (
    'Brands',
    'Contracts',
    'Companies',
    'Contract_Parties',
    'Traders',
    'Users',
    'Countries',
    'Ports' )

$file_number = 0
$total_storage_volume = 0
Get-AzDataLakeGen2ChildItem -Context $storageContext -FileSystem $containerName -Path "2025/10/26/13/59" -recurse | Where-Object { -not $_.IsDirectory -and $_.Name -like "*.csv.gz" } | Foreach-Object {
	$file_name_split = $_.Name -match 'dbo\.(.*?)_(\d{4})-(\d{2})-(\d{2})T(.*?)\+00\.csv\.gz'
    $file_name = $Matches[0]
	$tableName = $Matches[1]
    $year = $Matches[2]
    $month = $Matches[3]
    $day = $Matches[4]
	$time_of_the_day = $Matches[5]
	if ( $tableName -in $table_dependacies_list ) {
		$remotePath = $_.Path
		$file_storage_volume = [int]([int]$_.Length/(1024*1024))
	    $total_storage_volume = $total_storage_volume + $file_storage_volume
		$file_number = $file_number + 1

		Get-AzDataLakeGen2ItemContent -Context $storageContext -FileSystem $containerName -Path $remotePath -Destination $localFile -Force
		
	    # Write-Host $_.Name
	    Write-Host "${time_of_the_day}: $tableName $file_storage_volume MB"
	}
}
Write-Host "$file_number for a total of $total_storage_volume MB" # 789 MB





