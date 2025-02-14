function Get-SyncroAsset {
  <#
  .SYNOPSIS
  Gets SyncroRMM assets

  .DESCRIPTION
  Call SyncroRMM to retrieve assets

  .PARAMETER Id
  Id of requested asset

  .PARAMETER CustomerId
  ID of customer to retrieve assets for

  .PARAMETER AssetTypeId
  ID of asset types to retrieve

  .PARAMETER SNMP
  Retrieve assets with SNMP enabled

  .PARAMETER Query
  Search query to lookup assets

  .EXAMPLE Retrieve a single asset by ID
  Get-SyncroAsset -Id 12345

  .EXAMPLE Get all assets for customer with ID 12345
  Get-SyncroAsset -CustomerId 12345
  #>

  [CmdletBinding()]
  param (
    [ValidateRange(1, [int]::MaxValue)]
    [Int] $Id,
    [ValidateRange(1, [int]::MaxValue)]
    [Int] $CustomerId,
    [ValidateRange(1, [int]::MaxValue)]
    [Int] $AssetTypeId,
    [Alias('snmp_enabled')]
    [switch] $SNMP=$false,
    [String] $Query
  )

  if ($Id) {
    $SyncroRequest = @{
      Resource = "/customer_assets/$Id"
      Method = 'GET'
    }
    Invoke-SyncroRequest @SyncroRequest | Select-Object -ExpandProperty asset
  } else {
    $Params = @{}
    if ($CustomerId) { $Params.customer_id = $CustomerId }
    if ($AssetTypeId) { $Params.asset_type_id = $AssetTypeId }
    if ($SNMP.IsPresent) { $Params.snmp_enabled = $SNMP.IsPresent }
    if ($Query) { $Params.query = $Query }

    $SyncroRequest = @{
      Resource = '/customer_assets'
      Method = 'GET'
      Params = $Params
    }
    Invoke-SyncroRequestPaginated -SyncroRequest $SyncroRequest -Property assets
  }
}