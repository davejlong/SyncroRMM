function Get-SyncroTicketSettings {
  <#
  .SYNOPSIS
  Gets SyncroRMM ticket settings

  .DESCRIPTION
  Calls SyncroRMM API to retrieve account settings

  .EXAMPLE
  Get-SyncroTicketSettings
  # Retrieve all account settings
  #>
  [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "", Scope = 'Function')]

  Param()

  $SyncroRequest = @{
    Resource = '/tickets/settings'
    Method = 'GET'
  }
  Invoke-SyncroRequest @SyncroRequest
}
