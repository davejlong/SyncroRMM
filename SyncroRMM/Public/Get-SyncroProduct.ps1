function Get-SyncroProduct {
  <#
  .SYNOPSIS
  Gets Products from Syncro API

  .DESCRIPTION
  Retrieves products from Syncro API

  .PARAMETER Id
  ID of product to retrieve

  .EXAMPLE
  # Retrieve a single product by ID
  Get-SyncroProduct -Id 12345

  .EXAMPLE
  # Retrieve all products
  Get-SyncroProduct
  #>
  [CmdletBinding()]
  param (
    [ValidateRange(1, [Int]::MaxValue)]
    [Int] $Id
  )
  $Resource = "/products"

  if ($Id) {
    $SyncroRequest = @{
      Resource = "$Resource/$Id"
      Method = 'GET'
    }
    Invoke-SyncroRequest @SyncroRequest | Select-Object -ExpandProperty product
  } else {
    $Params = @{}

    $SyncroRequest = @{
      Resource = "$Resource"
      Method = 'GET'
      Params = $Params
    }
    Invoke-SyncroRequestPaginated -SyncroRequest $SyncroRequest -Property products
  }
}
