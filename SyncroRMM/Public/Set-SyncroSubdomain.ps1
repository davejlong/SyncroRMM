function Set-SyncroSubdomain {
  <#
  .SYNOPSIS
  Set the subdomain for your Syncro instance

  .DESCRIPTION
  In order to access the Syncro API, the subdomain must be set

  .EXAMPLE
  Set-SyncroSubdomain -Subdomain superman
  #>
  [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '', Scope = 'Function')]

  [CmdletBinding()]
  param (
    [Parameter(Mandatory=$false, ValueFromPipeline=$true)]
    [String] $Subdomain
  )
  process {
    if (!$Subdomain) {
      $Subdomain = Read-Host -Prompt 'Please enter your SyncroRMM subdomain, for example superman for https://superman.syncromsp.com:'
    }

    Set-Variable -Name 'Int_SyncroSubdomain' -Value $Subdomain -Visibility Private -Scope script -Force
  }
}