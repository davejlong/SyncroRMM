function Get-SyncroAssetType {
  <#
  .SYNOPSIS
  Gets SyncroRMM asset types

  .DESCRIPTION
  Uses the SyncroRMM account settings to retrieve asset types

  .PARAM Id
  Retrieve a specific asset type by ID
  #>
  [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseOutputTypeCorrectly', '', Scope = 'Function')]

  [CmdletBinding()]
  param (
      [ValidateRange(1, [int]::MaxValue)]
      [Int] $Id
  )

  $Settings = Get-SyncroSettings

  $AssetTypes = @{}
  foreach ($AssetType in $Settings.assets.asset_types.GetEnumerator()) {
    $AssetTypes[[string]$AssetType.id] = $AssetType.name
  }

  if ($Id) {
    $AssetTypes[[string]$Id]
  } else {
    $AssetTypes
  }
}