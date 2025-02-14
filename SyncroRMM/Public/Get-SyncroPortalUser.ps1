function Get-SyncroPortalUser {
  <#
  .SYNOPSIS
  Gets SyncroRMM Portal Users

  .DESCRIPTION
  Call SyncroRMM to retrieve portal users

  .PARAMETER CustomerId
  Customer ID to retrieve portal users for

  .PARAMETER Email
  Search for portal users by their email address
  #>
  [CmdletBinding()]
  param (
    [ValidateRange(1, [int]::MaxValue)]
    [Alias('customer_id')]
    [Int] $CustomerId,
    [string] $Email
  )

  $Params = @{}
  if ($CustomerId) { $Params.customer_id = $CustomerId }
  if ($Email) { $Params.email = $Email }

  $SyncroRequest = @{
    Resource = '/portal_users'
    Method = 'GET'
    Params = $Params
  }

  Invoke-SyncroRequestPaginated -SyncroRequest $SyncroRequest -Property portal_users
}