function Get-SyncroSettings {
  <#
  .SYNOPSIS
  Gets SyncroRMM account settings

  .DESCRIPTION
  Calls SyncroRMM API to retrieve account settings

  .EXAMPLE Retrieve all account settings
  Get-SyncroSettings
  #>
  $SyncroRequest = @{
    Resource = '/settings'
    Method = 'GET'
  }
  Invoke-SyncroRequest @SyncroRequest
}