function Get-SyncroTicketTimer {
  <#
  .SYNOPSIS
  Gets ticket timers

  .PARAMETER CreatedBefore
  Return ticket timers before the date provided

  .PARAMETER CreateAfter
  Return ticket timers after the date provided

  .DESCRIPTION
  Calls the SyncroRMM API to retrieve ticket timers

  .EXAMPLE
  Get-SyncroTicketTimer -CreatedAfter (Get-Date -Month 1 -Day 1)
  # Get ticket timers created this year

  .EXAMPLE
  $Date = Get-Date -Day 1
  Get-SyncroTicketTimer -CreatedAfter $Date.AddMonths(-1) -CreatedBefore $Date
  # Get ticket timers created last month
  #>
  [CmdletBinding()]
  param (
    [datetime] $CreatedBefore,
    [datetime] $CreatedAfter
  )

  $SyncroRequest = @{
    Resource = '/ticket_timers'
    Method = 'GET'
    Params = @{}
  }

  if ($null -ne $CreatedBefore) {
    $SyncroRequest.Params['created_at_lt'] = $CreatedBefore.ToString('yyyy-MM-dd')
  }
  if ($null -ne $CreatedAfter) {
    $SyncroRequest.Params['created_at_gt'] = $CreatedAfter.ToString('yyyy-MM-dd')
  }
  Invoke-SyncroRequestPaginated -SyncroRequest $SyncroRequest -Property ticket_timers
}