function Get-SyncroLead {
  <#
  .SYNOPSIS
  Gets Leads from Syncro API

  .DESCRIPTION
  Retrieves leads from Syncro API

  .PARAMETER Id
  ID of lead to retrieve

  .EXAMPLE
  Get-SyncroLead -Id 12345
  # Retrieve a single lead by ID

  .EXAMPLE
  Get-SyncroLead
  # Retrieve all leads
  #>
  [CmdletBinding()]
  param (
    [ValidateRange(1, [Int]::MaxValue)]
    [Int] $Id
  )
  $Resource = "/leads"

  if ($Id) {
    $SyncroRequest = @{
      Resource = "$Resource/$Id"
      Method = 'GET'
    }
    Invoke-SyncroRequest @SyncroRequest | Select-Object -ExpandProperty lead
  } else {
    $Params = @{}

    $SyncroRequest = @{
      Resource = "$Resource"
      Method = 'GET'
      Params = $Params
    }
    Invoke-SyncroRequestPaginated -SyncroRequest $SyncroRequest -Property leads
  }
}
