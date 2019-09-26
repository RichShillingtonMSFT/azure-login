function AZLogin
{
    # Enviornment Selection
    $Environments = Get-AzEnvironment
    $Script:Environment = $Environments | Out-GridView -Title "Please Select an Azure Enviornment." -PassThru

    # Connect to Azure
    try
    {
        $Script:AzAccount = Connect-AzAccount -Environment $($Environment.Name) -ErrorAction 'Stop'
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
            $Script:Subscription = $Subscriptions | Out-GridView -Title "Please Select a Subscription." -PassThru
            Set-AzContext $Subscription | Out-Null
            $Script:SubscriptionID = $Subscription.SubscriptionID
            $Script:TenantID = $Subscription.TenantId
        }
        else
        {
            $Script:Subscription = $Subscriptions
            $Script:SubscriptionID = $Subscriptions.SubscriptionID
            $Script:TenantID = $Subscriptions.TenantId
        }
    }
    catch
    {
        Write-Error -Message $_.Exception
        break
    }

    # Location Selection
    $Locations = Get-AzLocation
    $Script:Location = ($Locations | Out-GridView -Title "Please Select a location." -PassThru).Location
}

function ARMLogin
{
    # Enviornment Selection
    $Environments = Get-AzureRmEnvironment
    $Script:Environment = $Environments | Out-GridView -Title "Please Select an Azure Enviornment." -PassThru

    # Connect to Azure
    try
    {
        $Script:AzureRMAccount = Connect-AzureRmAccount -Environment $($Environment.Name) -ErrorAction 'Stop'
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
            $Script:Subscription = $Subscriptions | Out-GridView -Title "Please Select a Subscription." -PassThru
            Select-AzureRmSubscription $Subscription | Out-Null
            $Script:SubscriptionID = $Subscription.SubscriptionID
            $Script:TenantID = $Subscription.TenantId
        }
        else
        {
            $Script:Subscription = $Subscriptions
            $Script:SubscriptionID = $Subscriptions.SubscriptionID
            $Script:TenantID = $Subscriptions.TenantId
        }
    }
    catch
    {
        Write-Error -Message $_.Exception
        break
    }

    # Location Selection
    $Locations = Get-AzureRmLocation
    $Script:Location = ($Locations | Out-GridView -Title "Please Select a location." -PassThru).Location
}
