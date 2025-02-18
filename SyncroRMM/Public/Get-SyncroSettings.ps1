function Get-SyncroSettings {
  <#
  .SYNOPSIS
  Gets SyncroRMM account settings

  .DESCRIPTION
  Calls SyncroRMM API to retrieve account settings

  .EXAMPLE Retrieve all account settings
  Get-SyncroSettings
  #>
  [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "", Scope = 'Function')]

  Param()

  $SyncroRequest = @{
    Resource = '/settings'
    Method = 'GET'
  }
  Invoke-SyncroRequest @SyncroRequest
}
