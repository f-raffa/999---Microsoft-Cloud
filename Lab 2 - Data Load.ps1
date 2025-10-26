Clear-Host
write-host "Starting script at $(Get-Date)"

$resourceGroupName = "Synapse-Data-Platform-RG"
$dataLakeAccountName = "synapsedataptfrmstacct"
$containerName = "aquarius-refined"

write-host "Loading data..."
$storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $dataLakeAccountName
$storageContext = $storageAccount.Context

$storageVolumePerDay = 0
$last_loaded_day = ""
Get-ChildItem "./2024/*.csv.gz" -recurse -File | Foreach-Object {
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
    $blobPath = "dbo/$tableName/year=$year/month=$month/$destinationFileName"
    Set-AzStorageBlobContent -File $_.FullName -Container "$containerName" -Blob $blobPath -Context $storageContext
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