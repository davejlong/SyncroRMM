function Get-SyncroContact {
  <#
  .DESCRIPTION
  Get SyncroRMM contacts

  .DESCRIPTION
  Call SyncroRMM to retrieve contacts

  .PARAMETER Id
  ID of requested contact

  .PARAMETER CustomerId
  ID of the customer to request contacts for

  .EXAMPLE
  Get-SyncroContact -Id 12345
  # Retrieves a single contact by ID

  .EXAMPLE
  Get-SyncroContact -CustomerId 12345
  # Retrieves all contacts for the customer with ID 12345
  #>

  [CmdletBinding()]
  param (
    [ValidateRange(1, [int]::MaxValue)]
    [Int] $Id,
    [ValidateRange(1, [int]::MaxValue)]
    [Alias('customer_id')]
    [Int] $CustomerId
  )

  if ($Id) {
    $SyncroRequest = @{
      Resource = "/contacts/$Id"
      Method = 'GET'
    }
    Invoke-SyncroRequest @SyncroRequest | Select-Object -ExpandProperty contact
  } else {
    $Params = @{}
    if ($CustomerId) { $Params.customer_id = $CustomerId }

    $SyncroRequest = @{
      Resource = '/contacts'
      Method = 'GET'
      Params = $Params
    }
    Invoke-SyncroRequestPaginated -SyncroRequest $SyncroRequest -Property contacts
  }
}