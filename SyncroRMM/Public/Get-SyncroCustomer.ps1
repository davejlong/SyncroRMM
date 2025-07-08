function Get-SyncroCustomer {
  <#
  .SYNOPSIS
  Gets SyncroRMM customers

  .DESCRIPTION
  Call SyncroRMM to retrieve customers

  .PARAMETER Id
  Id of requested customer

  .PARAMETER FirstName
  First Name of requested customer

  .PARAMETER LastName
  Last Name of requested customer

  .PARAMETER BusinessName
  Business Name of requested customer

  .PARAMETER Email
  Email of requested customer

  .PARAMETER Disabled
  Whether or not to include disabled customers in list

  .PARAMETER Query
  Search query to lookup customers

  .EXAMPLE
  Get-SyncroCustomer -Id 12345
  # Retrieve a single customer by ID

  .EXAMPLE
  Get-SyncroCustomer -BusinessName Contoso
  # Get all customers with Contoso in their business name
  #>

  [CmdletBinding()]
  param (
    [ValidateRange(1, [int]::MaxValue)]
    [Int] $Id,
    [string] $FirstName,
    [string] $LastName,
    [Alias('business_name')]
    [string] $BusinessName,
    [string] $Email,
    [Alias('include_disabled')]
    [switch] $Disabled=$false,
    [String] $Query
  )

  if ($Id) {
    $SyncroRequest = @{
      Resource = "/customers/$Id"
      Method = 'GET'
    }
    Invoke-SyncroRequest @SyncroRequest | Select-Object -ExpandProperty customer
  } else {
    $Params = @{}
    if ($FirstName) { $Params.firstname = $FirstName }
    if ($LastName) { $Params.lastname = $LastName }
    if ($BusinessName) { $Params.business_name = $BusinessName }
    if ($Email) { $Params.email = $Email }
    if ($Disabled.IsPresent) { $Params.include_disabled = $Disabled.IsPresent }
    if ($Query) { $Params.query = $Query }

    $SyncroRequest = @{
      Resource = '/customers'
      Method = 'GET'
      Params = $Params
    }
    Invoke-SyncroRequestPaginated -SyncroRequest $SyncroRequest -Property customers
  }
}