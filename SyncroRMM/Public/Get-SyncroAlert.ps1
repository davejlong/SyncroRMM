function Get-SyncroAlert {
  <#
  .SYNOPSIS
  Gets Alerts from Syncro API

  .DESCRIPTION
  Retrieves RMM alerts from Syncro API

  .PARAMETER Id
  ID of alert to retrieve

  .PARAMETER Status
  Status of alerts to retrieve: Resolved, All, Active

  .EXAMPLE
  # Retrieve a single alert based on ID
  Get-SyncroAlert -Id 12345

  .EXAMPLE
  # Retrieve all active alerts
  Get-SyncroAlert -Status Active
  #>
  [CmdletBinding()]
  param (
    [ValidateRange(1, [Int]::MaxValue)]
    [Int] $Id,
    [ValidateSet("Resolved", "All", "Active")]
    [String] $Status
  )

  if ($Id) {
    $SyncroRequest = @{
      Resource = "/rmm_alerts/$Id"
      Method = 'GET'
    }
    Invoke-SyncroRequest @SyncroRequest | Select-Object -ExpandProperty rmm_alert
  } else {
    $Params = @{}
    if ($Status) { $Params.status = $Status }

    $SyncroRequest = @{
      Resource = "/rmm_alerts"
      Method = 'GET'
      Params = $Params
    }
    Invoke-SyncroRequestPaginated -SyncroRequest $SyncroRequest -Property rmm_alerts
  }
}
