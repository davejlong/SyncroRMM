function New-SyncroAsset {
  <#
  .SYNOPSIS
  Creates a new Syncro Asset

  .DESCRIPTION
  Calls SyncroRMM to create a new asset

  .PARAMETER Name
  Name of new asset

  .PARAMETER CustomerId
  ID of customer to create asset for

  .PARAMETER AssetTypeName
  Set asset type by Name (defaults to "Unmanaged Computer" if neither AssetTypeName or AssetTypeId are provided)

  .PARAMETER AssetTypeId
  Set asset type by ID

  .PARAMETER AssetSerial
  Serial number of new asset (must be unique)

  .PARAMETER Properties
  Custom Field values to set on new asset

  .EXAMPLE
  New-SyncroAsset -Name "Super PC" -CustomerId 12345 -AssetTypeName "Unmanaged Computer" -AssetSerial "123FGH"
  #>

  [CmdletBinding(SupportsShouldProcess)]
  param (
    [Parameter(Mandatory=$true)]
    [string] $Name,
    [Parameter(Mandatory=$true)]
    [ValidateRange(1, [int]::MaxValue)]
    [Alias('customer_id')]
    [Int] $CustomerId,
    [Parameter()]
    [Alias('asset_type_name')]
    [string] $AssetTypeName,
    [Parameter()]
    [ValidateRange(1, [int]::MaxValue)]
    [Alias('asset_type_id')]
    [Int] $AssetTypeId,
    [Parameter()]
    [Alias('asset_serial')]
    [string] $AssetSerial,
    [Parameter()]
    [hashtable] $Properties=@{}
  )

  $Asset = @{
    name = "$Name"
    customer_id = $CustomerId
    asset_serial = "$AssetSerial"
    properties = $Properties
  }

  if ($AssetTypeId) {
    $Asset.asset_type_id = $AssetTypeId
  } elseif ($AssetTypeName) {
    $Asset.asset_type_name = $AssetTypeName
  } else {
    $Asset.asset_type_name = "Unmanaged Computer"
  }

  $JSON = $Asset | ConvertTo-Json -Depth 2
  Write-Verbose $JSON

  $SyncroRequest = @{
    Resource = '/customer_assets'
    Method = 'POST'
    Body = $JSON
  }
  Write-Verbose ($SyncroRequest | ConvertTo-Json)
  if ($PSCmdlet.ShouldProcess($Name)) {
    Invoke-SyncroRequest @SyncroRequest
  } else {
    Write-Output "Would execute Syncro request with the following parameters"
    $SyncroRequest | Format-List
  }
}