# SyncroRMM PowerShell Module

PowerShell module for interacting with the SyncroRMM API. Heavily based on the [HuduAPI](https://github.com/lwhitelock/HuduAPI/) PowerShell module.

If this module helps you be more productive, consider donating to help me keep working on it.

<a href="https://www.buymeacoffee.com/davejlong" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

# Documentation

Documentation for each command can be found in the [/Docs](https://github.com/davejlong/SyncroRMM/tree/master/Docs) folder.

# Basic Usage

```
Import-Module SyncroRMM

# Set the subdomain and API key
Set-SyncroSubdomain -Subdomain applebees
Set-SyncroApiKey -ApiKey FDSA53421F

# Get the Contoso customer
$Customer = Get-SyncroCustomer -BusinessName "Contoso"

# Get all assets for Contoso
Get-SyncroAsset -CustomerId $Customer.Id
```
