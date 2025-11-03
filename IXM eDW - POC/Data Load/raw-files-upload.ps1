Connect-AzAccount -TenantId "bfcc27e6-aeae-460b-a71c-0e532f5d2555" -Subscription "010b2eb9-a8b8-48b5-a0d9-f0a65850eab0" -UseDeviceAuthentication   # Personal

Connect-AzAccount -TenantId "203fd445-2bc2-4a4c-93b4-df007cf1dd40" -Subscription "2cb0b54b-87b9-4ac2-bf54-792a6d303a34" -UseDeviceAuthentication   # IXM



$resourceGroupName = "Synapse-Data-Platform-RG"
$dataLakeAccountName = "synapsedataptfrmstacct"
$containerName = "aquarius-refined"

write-host "Loading data..."
$storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $dataLakeAccountName
$storageContext = $storageAccount.Context




Get-ChildItem "./2025/*.parquet" -recurse -File | Foreach-Object {
    Write-Host $_.FullName
    $file_name_split = $_.FullName -match 'dbo\.(.*?)_(\d{4})-(\d{2})-(\d{2})'
    $tableName = $Matches[1]
    $year = $Matches[2]
    $month = $Matches[3]
    $day = $Matches[4]
    write-host "tableName: $tableName"
    write-host "year:       $Year"
    write-host "month:      $Month"
    write-host "day:        $Day"
	$destinationFileName = $_.Name.Replace(".csv.gz", "")
    $blobPath = "Incremental/Parquet/$tableName/year=$year/month=$month/$destinationFileName"
    Set-AzStorageBlobContent -Context $storageContext -File $_.FullName -Container "$containerName" -Blob $blobPath -Force
    write-host "Content Uploaded"
}




$storageVolumePerDay = 0
$last_loaded_day = ""
Get-ChildItem "./FullSnapshot/*.csv.gz" -recurse -File | Foreach-Object {
    Write-Host $_.FullName
    $_.FullName -match 'dbo\.(.*?)_(\d{4})-(\d{2})-(\d{2})'
    $tableName = $Matches[1]
    $year = $Matches[2]
    $month = $Matches[3]
    $day = $Matches[4]
    write-host "tableName: $tableName"
    write-host "year:       $Year"
    write-host "month:      $Month"
    write-host "day:        $Day"
	$destinationFileName = $_.Name.Replace(".csv.gz", ".json")
    $blobPath = "FullSnapshot/$tableName/year=$year/month=$month/$destinationFileName"
    Set-AzStorageBlobContent -Context $storageContext -File $_.FullName -Container "$containerName" -Blob $blobPath -Force
    write-host "Content Uploaded"

    if (($last_loaded_day -ne $day) -and ($last_loaded_day -ne "")) {
    	echo $storageVolumePerDay > "./$year/$month/$last_loaded_day/$year$month$last_loaded_day - Storage Volume in KB.txt"
        $storageVolumePerDay = 0
    }
    $storageVolumePerDay = $storageVolumePerDay + [math]::ceiling($_.length / 1kb)
    $last_loaded_day = "$day"
    write-host ""
}


write-host "Script completed at $(Get-Date)"






# dbo.Assayers
# dbo.Assay_Exchange
# dbo.Bank_Pay_Detail
# dbo.BlendAssoc
# dbo.BlendDetails
# dbo.Calendars
# dbo.CommentTemplate
# dbo.Commodities
# dbo.Companies
# dbo.Contracts
# dbo.Contract_Assay_Ledger
# dbo.Contract_Latest_Invoice
# dbo.Contract_Latest_Invoice_Mets
# dbo.Contract_Metals
# dbo.Contract_Parties
# dbo.Contract_QPTerms
# dbo.Contract_Results
# dbo.Contract_Rules
# dbo.Contract_rule_text
# dbo.Curr_Multipliers
# dbo.DataBaseMode
# dbo.InvoiceDictionary
# dbo.Metals
# dbo.Metal_Hedge_Defaults
# dbo.Ports
# dbo.Products
# dbo.Qualities
# dbo.SailingDays
# dbo.Saved_ConInv_Details
# dbo.Sundry_Costs
# dbo.Sundry_Invoice_Details
# dbo.TaxGroupTaxCode
# dbo.Terminal_Trades
# dbo.Terminal_Trades
# dbo.Traders
# dbo.Umpire_Rules
# dbo.Users