function Get-SyncroVendor {
  <#
  .SYNOPSIS
  Gets Vendors from Syncro API

  .DESCRIPTION
  Retrieves vendors from Syncro API

  .PARAMETER Id
  ID of vendor to retrieve

  .EXAMPLE
  # Retrieve a single vendor by ID
  Get-SyncroVendor -Id 12345

  .EXAMPLE
  # Retrieve all vendors
  Get-SyncroVendor
  #>
  [CmdletBinding()]
  param (
    [ValidateRange(1, [Int]::MaxValue)]
    [Int] $Id
  )
  $Resource = "/vendors"

  if ($Id) {
    $SyncroRequest = @{
      Resource = "$Resource/$Id"
      Method = 'GET'
    }
    Invoke-SyncroRequest @SyncroRequest | Select-Object -ExpandProperty vendor
  } else {
    $Params = @{}

    $SyncroRequest = @{
      Resource = "$Resource"
      Method = 'GET'
      Params = $Params
    }
    Invoke-SyncroRequestPaginated -SyncroRequest $SyncroRequest -Property vendors
  }
}
