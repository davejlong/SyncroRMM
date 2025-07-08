function Get-SyncroInvoice {
  <#
  .SYNOPSIS
  Gets Invoices from Syncro API

  .DESCRIPTION
  Retrieves invoices from Syncro API

  .PARAMETER Id
  ID of invoice to retrieve

  .EXAMPLE
  Get-SyncroInvoice -Id 12345
  # Retrieve a single invoice by ID

  .EXAMPLE
  Get-SyncroInvoice
  # Retrieve all invoices
  #>
  [CmdletBinding()]
  param (
    [ValidateRange(1, [Int]::MaxValue)]
    [Int] $Id
  )
  $Resource = "/invoices"

  if ($Id) {
    $SyncroRequest = @{
      Resource = "$Resource/$Id"
      Method = 'GET'
    }
    Invoke-SyncroRequest @SyncroRequest | Select-Object -ExpandProperty invoice
  } else {
    $Params = @{}

    $SyncroRequest = @{
      Resource = "$Resource"
      Method = 'GET'
      Params = $Params
    }
    Invoke-SyncroRequestPaginated -SyncroRequest $SyncroRequest -Property invoices
  }
}
