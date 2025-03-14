# SyncroRMM PowerShell Module

PowerShell module for interacting with the SyncroRMM API. Heavily based on the [HuduAPI](https://github.com/lwhitelock/HuduAPI/) PowerShell module.

If this module helps you be more productive, consider donating to help me keep working on it.

<a href="https://www.buymeacoffee.com/davejlong" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

## Documentation

Documentation for each command can be found in the [/Docs](https://github.com/davejlong/SyncroRMM/tree/master/Docs) folder.

## Authentication

The module needs two items items for authentication:

* Subdomain - The unique subdomain for your Syncro tenant (ie. for https://mycompany.syncromsp.com), the subdomain to use is "mycompany")
* API Key - An API key generated from the Syncro Admin center

There are two ways to make the Subdomain and API Key available to the module:

### Environment Variables

Set environment variables for the following:

* `SyncroAPIKey` - Environment variable containing an encrypted copy of your API Key
* `SyncroSubdomain` - Environment variable containing the Subdomain

To generate the encrypted API key use the following commands:

```
$SyncroKey = "FDSA53421F"
$SecSyncroKey = ConvertTo-SecureString -String $SyncroKey -AsPlainText -Force
$SecSyncroKey | ConvertFrom-SecureString
```

### Commands

Call the following commands:

```
Set-SyncroApiKey -ApiKey FDSA53421F
Set-SyncroSubdomain -Subdomain applebees
```

## Basic Usage

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
