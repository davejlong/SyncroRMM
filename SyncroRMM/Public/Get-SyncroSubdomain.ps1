function Get-SyncroSubdomain {
  <#
  .SYNOPSIS
  Get SyncroRMM Base URL

  .DESCRIPTION
  Returns SyncroRMM Base URL

  .EXAMPLE
  Get-SyncroSubdomain

  #>
  [CmdletBinding()]
  Param()
  if ($null -ne $Int_SyncroSubdomain) {
    return $Int_SyncroSubdomain
  } elseif ($null -ne $env:SyncroSubdomain) {
    return $env:SyncroSubdomain
  } else {
    Write-Error 'No subdomain has been set. Please use Set-SyncroSubdomain to set it.'
  }
}