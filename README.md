# azure-login
If you use PowerShell to interact with Azure, this will make connecting and authenticating to Azure much easier.

I work with PowerShell everyday mostly automating Azure workloads. I find myself contently logging in to different Azure Subscriptions and tenants to perform test or to grab information.

To make my life easier, I load this function in my PowerShell profile by default when PowerShell is launched.

Now, instead of having to use 10 different commands to specify an environment, connect to Azure, set my working Subscription, get the SubscriptionID and TenantID and choose my location, I can do this all with one command.

AzLogin - if I am working with Az modules.

ARMLogin - if I am working with AzureRM modules.

To set this up, create a folder and save the AzureLoginFunctions.ps1 file in it.
Example: C:\Users\[ProfileDir]\Documents\PowerShellFuntions
You can place other functions or scripts in this directory as well if you want them to load each time you launch PowerShell.

Using the list below, decide how you want the profile to load and for which users.
Download a copy of the corresponding sample profile .ps1 script and place it in that location.
Modify the $FunctionDirectory variable to match the location you picked for your scripts.

All Users All Hosts - C:\Windows\System32\WindowsPowerShell\v1.0\profile.ps1                                 
All Users ISE Only - C:\Windows\System32\WindowsPowerShell\v1.0\Microsoft.PowerShellISE_profile.ps1
All Users Console Only - C:\Windows\System32\WindowsPowerShell\v1.0\Microsoft.PowerShell_profile.ps1   
Current User All Hosts - C:\Users\[ProfileDir]\Documents\WindowsPowerShell\profile.ps1                           
Current User ISE Only - C:\Users\[ProfileDir]\Documents\WindowsPowerShell\Microsoft.PowerShellISE_profile.ps1
Current User Console Only - C:\Users\[ProfileDir]\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

That’s all you need to do. Now when you open PowerShell, the AzLogin and ARMLogin functions will load for you.
If you want to connect to Azure, just type AzLogin or ARMLogin and hit enter.

If you want to see it in action, check out the Screen Shots folder in this repository.
