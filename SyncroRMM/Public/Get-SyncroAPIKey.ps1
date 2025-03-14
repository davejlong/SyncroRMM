function Get-SyncroApiKey {
  <#
  .SYNOPSIS
  Get SyncroRMM API key

  .DESCRIPTION
  Returns SyncroRMM API key in securestring format

  .EXAMPLE
  Get-SyncroApiKey

  #>
  [CmdletBinding()]
  Param()

  if ($null -ne $Int_SyncroAPIKey) {
    return $Int_SyncroAPIKey
  } elseif ($null -ne $env:SyncroAPIKey) {
    return ConvertTo-SecureString -String $env:SyncroAPIKey
  } else {
    Write-Error 'No API key has been set. Please use Set-SyncroAPIKey to set it.'
  }
}