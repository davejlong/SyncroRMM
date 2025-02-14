function Set-SyncroAPIKey {
  <#
  .SYNOPSIS
  Set SyncroRMM API Key

  .DESCRIPTION
  API keys are required to interact with SyncroRMM

  .PARAM ApiKey
  The API key

  .EXAMPLE
  Set-SyncroAPIKey -ApiKey foobar1234
  #>
  [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '', Scope = 'Function')]
  [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingConvertToSecureStringWithPlainText', '', Scope = 'Function')]

  [CmdletBinding()]
  param (
    [Parameter(Mandatory=$False, ValueFromPipeline=$true)]
    [String] $ApiKey
  )
  process {
    if ($ApiKey) {
      $SecApiKey = ConvertTo-SecureString $ApiKey -AsPlainText -Force
    } else {
      $SecApiKey = Read-Host -Prompt 'Please enter your SyncroRMM API key, you can obtain it from https://your-syncro-subdomain.syncromsp.com/api_tokens' -AsSecureString
    }

    Set-Variable -Name 'Int_SyncroAPIKey' -Value $SecApiKey -Visibility Private -Scope script -Force
  }
}