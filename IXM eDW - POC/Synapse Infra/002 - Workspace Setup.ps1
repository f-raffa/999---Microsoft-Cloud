Clear-Host
write-host "Starting script at $(Get-Date)"
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-Module -Name Az.Synapse -Force

# Handle cases where the user has multiple subscriptions
$subs = Get-AzSubscription | Select-Object
if($subs.GetType().IsArray -and $subs.length -gt 1){
    Write-Host "You have multiple Azure subscriptions - please select the one you want to use:"
    for($i = 0; $i -lt $subs.length; $i++)
    {
            Write-Host "[$($i)]: $($subs[$i].Name) (ID = $($subs[$i].Id))"
    }
    $selectedIndex = -1
    $selectedValidIndex = 0
    while ($selectedValidIndex -ne 1)
    {
            $enteredValue = Read-Host("Enter 0 to $($subs.Length - 1)")
            if (-not ([string]::IsNullOrEmpty($enteredValue)))
            {
                if ([int]$enteredValue -in (0..$($subs.Length - 1)))
                {
                    $selectedIndex = [int]$enteredValue
                    $selectedValidIndex = 1
                }
                else
                {
                    Write-Output "Please enter a valid subscription number."
                }
            }
            else
            {
                Write-Output "Please enter a valid subscription number."
            }
    }
    $selectedSub = $subs[$selectedIndex].Id
    Select-AzSubscription -SubscriptionId $selectedSub
    az account set --subscription $selectedSub
}

# Register resource providers
# Write-Host "Registering resource providers...";
$provider_list = "Microsoft.Synapse", "Microsoft.Sql", "Microsoft.Storage", "Microsoft.Compute"

# Generate unique random suffix
[string]$suffix =  -join ((48..57) + (97..122) | Get-Random -Count 7 | % {[char]$_})
Write-Host "Your randomly-generated suffix for Azure resources is $suffix"
Write-Output $suffix > "000 - DeploymentSuffix.txt"

# Choose a random region
Write-Host "Finding an available region. This may take several minutes...";
$delay = 0, 30, 60, 90, 120 | Get-Random
Start-Sleep -Seconds $delay # random delay to stagger requests from multi-student classes
$preferred_list = $("westeurope")
$locations = Get-AzLocation | Where-Object {
    $_.Providers -contains "Microsoft.Synapse" -and
    $_.Providers -contains "Microsoft.Sql" -and
    $_.Providers -contains "Microsoft.Storage" -and
    $_.Providers -contains "Microsoft.Compute" -and
    $_.Location -in $preferred_list
}
$Region = $locations.Location

# Test for subscription Azure SQL capacity constraints in randomly selected regions
# (for some subsription types, quotas are adjusted dynamically based on capacity)
 $success = 0
 $tried_list = New-Object Collections.Generic.List[string]

 while ($success -ne 1){
    write-host "Trying $Region"
    $capability = Get-AzSqlCapability -LocationName $Region
    if($capability.Status -eq "Available")
    {
        $success = 1
        write-host "Using $Region"
    }
    else
    {
        $success = 0
        $tried_list.Add($Region)
        $locations = $locations | Where-Object {$_.Location -notin $tried_list}
        if ($locations.Count -ne 1)
        {
            $rand = (0..$($locations.Count - 1)) | Get-Random
            $Region = $locations.Get($rand).Location
        }
        else {
            Write-Host "Couldn't find an available region for deployment."
            Write-Host "Sorry! Try again later."
            Exit
        }
    }
}

# Ensure that all the required providers have completed registration
$max_retries = 5
$wait_time = 30
foreach ($provider in $provider_list) {
    $retryCount = 0
    while ($retryCount -lt $max_retries) {
        $currentStatus = (Get-AzResourceProvider -ProviderNamespace $provider).RegistrationState
        if ($currentStatus -eq "Registered") {
            Write-Host "$provider is successfully registered."
            break
        }
        else {
            Write-Host "$provider is not yet registered. Waiting for $wait_time seconds before rechecking..."
            Start-Sleep -Seconds $wait_time
            $retryCount++
        }
    }
    if ($retryCount -eq $max_retries) {
        Write-Host "Failed to register $provider after $max_retries attempts."
    }
}

$resourceGroupName = "Synapse-Warehouse-RG"

# Create Synapse workspace
$synapseWorkspace = "synapse-warehouse-ws"
$dataLakeAccountName = "defaultstorage$suffix"
$sparkPool = "sparkpool"
$sqlUser = "SQLUser"
$sqlPassword = 'llBRUT$5000'
$sqlDatabaseName = "sqlpool"

Write-Host "Creating $resourceGroupName resource group in $Region ..."
New-AzResourceGroup -Name $resourceGroupName -Location $Region -Force| Out-Null
write-host "Creating $synapseWorkspace Synapse Analytics workspace in $resourceGroupName resource group with the following parameters:"
write-host " resourceGroupName= $resourceGroupName"
write-host " synapseWorkspace= $synapseWorkspace"
write-host " dataLakeAccountName= $dataLakeAccountName"
write-host " sparkPool= $sparkPool"
write-host " sqlDatabaseName= $sqlDatabaseName"
write-host " sqlUser= $sqlUser"
write-host " sqlPassword= $sqlPassword"
write-host " suffix= $suffix"
write-host "(This may take some time!)"
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName `
  -Name "synapse-workspace-deployment-$suffix" `
  -TemplateFile "003 - Workspace Setup.json" `
  -Mode Incremental `
  -workspaceName $synapseWorkspace `
  -dataLakeAccountName $dataLakeAccountName `
  -sparkPoolName $sparkPool `
  -sqlDatabaseName $sqlDatabaseName `
  -sqlUser $sqlUser `
  -sqlPassword $sqlPassword `
  -uniqueSuffix $suffix `
  -Force

# # Pause Data Explorer pool
# write-host "Pausing the $adxpool Data Explorer Pool..."
# Stop-AzSynapseKustoPool -Name $adxpool -ResourceGroupName $resourceGroupName -WorkspaceName $synapseWorkspace -NoWait

# Make the current user and the Synapse service principal owners of the data lake blob store
write-host "Granting permissions on the $dataLakeAccountName storage account..."
write-host "(you can ignore any warnings!)"
$subscriptionId = (Get-AzContext).Subscription.Id
$userName = ((az ad signed-in-user show) | ConvertFrom-JSON).UserPrincipalName
#$id = (Get-AzADServicePrincipal -DisplayName $synapseWorkspace).id
#New-AzRoleAssignment -Objectid $id -RoleDefinitionName "Storage Blob Data Owner" -Scope "/subscriptions/$subscriptionId/resourceGroups/$resourceGroupName/providers/Microsoft.Storage/storageAccounts/$dataLakeAccountName" -ErrorAction SilentlyContinue;
New-AzRoleAssignment -SignInName $userName -RoleDefinitionName "Storage Blob Data Owner" -Scope "/subscriptions/$subscriptionId/resourceGroups/$resourceGroupName/providers/Microsoft.Storage/storageAccounts/$dataLakeAccountName" -ErrorAction SilentlyContinue;

write-host "Script completed at $(Get-Date)"
