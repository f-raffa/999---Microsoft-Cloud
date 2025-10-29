write-host "Starting script at $(Get-Date)"

$resourceGroupName = "Synapse-AllLabs-RG"

$uniqueSuffix = Get-Content "000 - DeploymentSuffix.txt"

$dataLakeAccountName = "datalake$uniqueSuffix"
$containerName = "tests-and-learn"


write-host "Initializing the Quotas and Limits Storage Account Container with the following parameters:"
write-host " resourceGroupName= $resourceGroupName"
write-host " dataLakeAccountName= $dataLakeAccountName"
write-host "(This may take some time!)"
New-AzResourceGroupDeployment -ResourceGroupName "$resourceGroupName" `
  -Name "testsandlearncontainerdeployment" `
  -TemplateFile "006 - Quotas Usage and Limits Setup.json" `
  -Mode Incremental `
  -dataLakeAccountName "$dataLakeAccountName" `
  -containerName "$containerName" `
  -Force