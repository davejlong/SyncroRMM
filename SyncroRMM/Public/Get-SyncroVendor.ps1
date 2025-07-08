function Get-SyncroVendor {
  <#
  .SYNOPSIS
  Gets Vendors from Syncro API

  .DESCRIPTION
  Retrieves vendors from Syncro API

  .PARAMETER Id
  ID of vendor to retrieve

  .EXAMPLE
  Get-SyncroVendor -Id 12345
  # Retrieve a single vendor by ID

  .EXAMPLE
  Get-SyncroVendor
  # Retrieve all vendors
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
