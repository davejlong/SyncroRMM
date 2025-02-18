function Get-SyncroWorksheetResult {
  <#
  .SYNOPSIS
  Gets Worksheet Results from Syncro API

  .DESCRIPTION
  Retrieves worksheet results from Syncro API

  .PARAMETER TicketId
  Ticket ID to pull worksheets for

  .PARAMETER Id
  ID of worksheet result to retrieve

  .EXAMPLE
  # Retrieve a single worksheet result by ID
  Get-SyncroWorksheetResult -TicketId 98765 -Id 12345

  .EXAMPLE
  # Retrieve all worksheet results for a ticket
  Get-SyncroWorksheetResult -TicketId 12345
  #>
  [CmdletBinding()]
  param (
    [ValidateRange(1, [Int]::MaxValue)]
    [Int] $Id,
    [Parameter(mandatory=$true)]
    [ValidateRange(1, [Int]::MaxValue)]
    [Int] $TicketId
  )
  
  $Resource = "/tickets/$TicketId/worksheet_results"

  if ($Id) {
    $SyncroRequest = @{
      Resource = "$Resource/$Id"
      Method = 'GET'
    }
    Invoke-SyncroRequest @SyncroRequest | Select-Object -ExpandProperty worksheet_result
  } else {
    $Params = @{}

    $SyncroRequest = @{
      Resource = "$Resource"
      Method = 'GET'
      Params = $Params
    }
    Invoke-SyncroRequestPaginated -SyncroRequest $SyncroRequest -Property worksheet_results
  }
}
