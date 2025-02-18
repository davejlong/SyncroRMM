function Get-SyncroSchedule {
  <#
  .SYNOPSIS
  Gets Schedules from Syncro API

  .DESCRIPTION
  Retrieves schedules from Syncro API

  .PARAMETER Id
  ID of schedule to retrieve

  .EXAMPLE
  # Retrieve a single schedule by ID
  Get-SyncroSchedule -Id 12345

  .EXAMPLE
  # Retrieve all schedules
  Get-SyncroSchedule
  #>
  [CmdletBinding()]
  param (
    [ValidateRange(1, [Int]::MaxValue)]
    [Int] $Id
  )
  $Resource = "/schedules"

  if ($Id) {
    $SyncroRequest = @{
      Resource = "$Resource/$Id"
      Method = 'GET'
    }
    Invoke-SyncroRequest @SyncroRequest | Select-Object -ExpandProperty schedule
  } else {
    $Params = @{}

    $SyncroRequest = @{
      Resource = "$Resource"
      Method = 'GET'
      Params = $Params
    }
    Invoke-SyncroRequestPaginated -SyncroRequest $SyncroRequest -Property schedules
  }
}
