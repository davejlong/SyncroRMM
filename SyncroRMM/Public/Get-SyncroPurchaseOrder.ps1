function Get-SyncroPurchaseOrder {
  <#
  .SYNOPSIS
  Gets Purchase Orders from Syncro API

  .DESCRIPTION
  Retrieves purchase orders from Syncro API

  .PARAMETER Id
  ID of purchase order to retrieve

  .EXAMPLE
  # Retrieve a single purchase order by ID
  Get-SyncroPurchaseOrder -Id 12345

  .EXAMPLE
  # Retrieve all purchase orders
  Get-SyncroPurchaseOrder
  #>
  [CmdletBinding()]
  param (
    [ValidateRange(1, [Int]::MaxValue)]
    [Int] $Id
  )
  $Resource = "/purchase_orders"

  if ($Id) {
    $SyncroRequest = @{
      Resource = "$Resource/$Id"
      Method = 'GET'
    }
    Invoke-SyncroRequest @SyncroRequest | Select-Object -ExpandProperty purchase_order
  } else {
    $Params = @{}

    $SyncroRequest = @{
      Resource = "$Resource"
      Method = 'GET'
      Params = $Params
    }
    Invoke-SyncroRequestPaginated -SyncroRequest $SyncroRequest -Property purchase_orders
  }
}
