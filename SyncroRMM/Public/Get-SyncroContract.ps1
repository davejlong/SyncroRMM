function Get-SyncroContract {
  <#
  .SYNOPSIS
  Gets Contracts from Syncro API

  .DESCRIPTION
  Retrieves contracts from Syncro API

  .PARAMETER Id
  ID of contract to retrieve

  .EXAMPLE
  # Retrieve a single contract by ID
  Get-SyncroContract -Id 12345

  .EXAMPLE
  # Retrieve all contracts
  Get-SyncroContract
  #>
  [CmdletBinding()]
  param (
    [ValidateRange(1, [Int]::MaxValue)]
    [Int] $Id
  )
  $Resource = "/contracts"

  if ($Id) {
    $SyncroRequest = @{
      Resource = "$Resource/$Id"
      Method = 'GET'
    }
    Invoke-SyncroRequest @SyncroRequest
  } else {
    $Params = @{}

    $SyncroRequest = @{
      Resource = "$Resource"
      Method = 'GET'
      Params = $Params
    }
    Invoke-SyncroRequestPaginated -SyncroRequest $SyncroRequest -Property contracts
  }
}
