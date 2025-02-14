function Get-SyncroTicketSettings {
  <#
  .SYNOPSIS
  Gets SyncroRMM ticket settings

  .DESCRIPTION
  Calls SyncroRMM API to retrieve account settings

  .EXAMPLE Retrieve all account settings
  Get-SyncroTicketSettings
  #>
  [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "", Scope = 'Function')]

  $SyncroRequest = @{
    Resource = '/tickets/settings'
    Method = 'GET'
  }
  Invoke-SyncroRequest @SyncroRequest
}