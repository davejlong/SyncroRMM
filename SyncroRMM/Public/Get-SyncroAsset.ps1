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

  .PARAMETER AssetSearchId
  ID of a saved asset search

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
    [Alias('customer_id')]
    [ValidateRange(1, [int]::MaxValue)]
    [Int] $CustomerId,
    [Alias('asset_type_id')]
    [ValidateRange(1, [int]::MaxValue)]
    [Int] $AssetTypeId,
    [Alias('asset_search_id')]
    [ValidateRange(1, [Int]::MaxValue)]
    [Int] $AssetSearchId
    [Alias('snmp_enabled')]
    [switch] $SNMP=$false,
    [String] $Query,
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
    if ($AssetSearchId) { $Params.asset_search_id = $AssetSearchId }

    $SyncroRequest = @{
      Resource = '/customer_assets'
      Method = 'GET'
      Params = $Params
    }
    Invoke-SyncroRequestPaginated -SyncroRequest $SyncroRequest -Property assets
  }
}
