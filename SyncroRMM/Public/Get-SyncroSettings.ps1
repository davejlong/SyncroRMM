function Get-SyncroSettings {
  <#
  .SYNOPSIS
  Gets SyncroRMM account settings

  .DESCRIPTION
  Calls SyncroRMM API to retrieve account settings

  .EXAMPLE
  Get-SyncroSettings
  # Retrieve all account settings
  #>
  [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "", Scope = 'Function')]

  Param()

  $SyncroRequest = @{
    Resource = '/settings'
    Method = 'GET'
  }
  Invoke-SyncroRequest @SyncroRequest
}
