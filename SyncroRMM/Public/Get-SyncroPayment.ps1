function Get-SyncroPayment {
  <#
  .SYNOPSIS
  Gets Payments from Syncro API

  .DESCRIPTION
  Retrieves payments from Syncro API

  .PARAMETER Id
  ID of payment to retrieve

  .EXAMPLE
  Get-SyncroPayment -Id 12345
  # Retrieve a single payment by ID

  .EXAMPLE
  Get-SyncroPayment
  # Retrieve all payments
  #>
  [CmdletBinding()]
  param (
    [ValidateRange(1, [Int]::MaxValue)]
    [Int] $Id
  )
  $Resource = "/payments"

  if ($Id) {
    $SyncroRequest = @{
      Resource = "$Resource/$Id"
      Method = 'GET'
    }
    Invoke-SyncroRequest @SyncroRequest | Select-Object -ExpandProperty payment
  } else {
    $Params = @{}

    $SyncroRequest = @{
      Resource = "$Resource"
      Method = 'GET'
      Params = $Params
    }
    Invoke-SyncroRequestPaginated -SyncroRequest $SyncroRequest -Property payments
  }
}
