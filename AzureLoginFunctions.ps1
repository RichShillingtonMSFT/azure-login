function AZLogin
{
    # Enviornment Selection
    $Environments = Get-AzEnvironment
    $Environment = $Environments | Out-GridView -Title "Please Select an Azure Enviornment." -PassThru

    # Connect to Azure
    try
    {
        $AzAccount = Connect-AzAccount -Environment $($Environment.Name) -ErrorAction 'Stop'
    }
    catch
    {
        Write-Error -Message $_.Exception
        break
    }

    try 
    {
        $Subscriptions = Get-AzSubscription
        if ($Subscriptions.Count -gt '1')
        {
            $Subscription = $Subscriptions | Out-GridView -Title "Please Select a Subscription." -PassThru
            Set-AzContext $Subscription
            $SubscriptionID = $Subscription.SubscriptionID
            $TenantID = $Subscription.TenantId
        }
        else
        {
            $SubscriptionID = $Subscriptions.SubscriptionID
            $TenantID = $Subscriptions.TenantId
        }
    }
    catch
    {
        Write-Error -Message $_.Exception
        break
    }

    # Location Selection
    $Locations = Get-AzLocation
    $Location = ($Locations | Out-GridView -Title "Please Select a location." -PassThru).Location
}

function ARMLogin
{
    # Enviornment Selection
    $Environments = Get-AzureRmEnvironment
    $Environment = $Environments | Out-GridView -Title "Please Select an Azure Enviornment." -PassThru

    # Connect to Azure
    try
    {
        $AzureRMAccount = Connect-AzureRmAccount -Environment $($Environment.Name) -ErrorAction 'Stop'
    }
    catch
    {
        Write-Error -Message $_.Exception
        break
    }

    try 
    {
        $Subscriptions = Get-AzureRmSubscription
        if ($Subscriptions.Count -gt '1')
        {
            $Subscription = $Subscriptions | Out-GridView -Title "Please Select a Subscription." -PassThru
            Select-AzureRmSubscription $Subscription
            $SubscriptionID = $Subscription.SubscriptionID
            $TenantID = $Subscription.TenantId
        }
        else
        {
            $SubscriptionID = $Subscriptions.SubscriptionID
            $TenantID = $Subscriptions.TenantId
        }
    }
    catch
    {
        Write-Error -Message $_.Exception
        break
    }


    # Location Selection
    $Locations = Get-AzureRmLocation
    $Location = ($Locations | Out-GridView -Title "Please Select a location." -PassThru).Location
}