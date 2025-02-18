function Get-SyncroEstimate {
  <#
  .SYNOPSIS
  Gets Estimates from Syncro API

  .DESCRIPTION
  Retrieves estimates from Syncro API

  .PARAMETER Id
  ID of estimate to retrieve

  .EXAMPLE
  # Retrieve a single estimate by ID
  Get-SyncroEstimate -Id 12345

  .EXAMPLE
  # Retrieve all estimates
  Get-SyncroEstimate
  #>
  [CmdletBinding()]
  param (
    [ValidateRange(1, [Int]::MaxValue)]
    [Int] $Id
  )
  $Resource = "/estimates"

  if ($Id) {
    $SyncroRequest = @{
      Resource = "$Resource/$Id"
      Method = 'GET'
    }
    Invoke-SyncroRequest @SyncroRequest | Select-Object -ExpandProperty estimate
  } else {
    $Params = @{}

    $SyncroRequest = @{
      Resource = "$Resource"
      Method = 'GET'
      Params = $Params
    }
    Invoke-SyncroRequestPaginated -SyncroRequest $SyncroRequest -Property estimates
  }
}
