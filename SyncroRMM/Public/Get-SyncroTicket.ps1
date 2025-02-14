enum TicketSatus {
  New#  = "New"
  InProgress#  = "In Progress"
  Resolved#  = "Resolved"
  Invoiced# = "Invoiced"
  WaitingForParts# = "Waiting for Parts"
  WaitingOnCustomer# = "Waiting on Customer"
  Scheduled# = "Scheduled"
  CustomerReply# = "Customer Reply"
  NotClosed#  = "Not Closed"
}

function Get-SyncroTicket {
  <#
  .SYNOPSIS
  Gets tickets from SyncroRMM

  .DESCRIPTION
  Retrieves ticket details from the SyncroRMM API

  .PARAMETER Id
  ID of a specific ticket to retrieve

  .PARAMETER CustomerId
  Customer ID to retrieve tickets for

  .PARAMETER Contact ID
  Contact ID to retrieve tickets for

  .PARAMETER UserId
  Retreive tickets assigned to a specific user

  .PARAMETER TicketSearchId
  Retrieve tickets for a saved search

  .PARAMETER Status
  Retrieve tickets based on their status

  .PARAMETER Number
  Retrieve ticket by the ticket number

  .PARAMETER ResolvedAfter
  Retrieve tickets resolved after a specific date

  .PARAMETER CreatedAfter
  Retrieve tickets created after a specific date

  .PARAMETER SinceUpdatedAt
  Retrieve tickets updated after a specific date

  .PARAMETER Query
  Generic search terms to search for tickets

  .EXAMPLE
  # Get a ticket by it's ID
  Get-SyncroTicket -Id 12345
  #>

  [CmdletBinding()]
  param (
    [ValidateRange(1, [Int]::MaxValue)]
    [Int] $Id,
    [ValidateRange(1, [Int]::MaxValue)]
    [Int] $CustomerId,
    [ValidateRange(1, [Int]::MaxValue)]
    [Int] $ContactId,
    [ValidateRange(1, [Int]::MaxValue)]
    [Int] $UserId,
    [ValidateRange(1, [Int]::MaxValue)]
    [Int] $TicketSearchId,
    [ValidateRange(1, [Int]::MaxValue)]
    [Int] $Number,
    [TicketSatus] $Status,
    [Alias('resolved_after')]
    [datetime] $ResolvedAfter,
    [Alias('created_after')]
    [datetime] $CreatedAfter,
    [Alias('sinced_updated_at')]
    [datetime] $SinceUpdatedAt,
    [string] $Query
  )

  if ($Id) {
    $SyncroRequest = @{
      Resource = "/tickets/$Id"
      Method = 'GET'
    }
    Invoke-SyncroRequest @SyncroRequest | Select-Object -ExpandProperty ticket
  } else {
    $Params = @{}
    if ($CustomerId) { $Params.customer_id = $CustomerId }
    if ($ContactId) { $Params.contact_id = $ContactId }
    if ($UserId) { $Params.user_id = $UserId }
    if ($TicketSearchId) { $Params.ticket_search_id = $TicketSearchId }
    if ($Number) { $Params.number = $Number }
    if ($Status) {
      $Params.status = ($Status -creplace '([A-Z])', ' $1').Trim()
    }
    if ($ResolvedAfter) {
      $Params.resolved_after = Get-Date $ResolvedAfter -Format "yyyy-MM-dd"
    }
    if ($CreatedAfter) {
      $Params.created_after = Get-Date $CreatedAfter -Format "yyyy-MM-dd"
    }
    if ($SinceUpdatedAt) {
      $Params.since_updated_at = Get-Date $SinceUpdatedAt -Format "yyyy-MM-dd"
    }
    if ($Query) { $Params.query = $Query}


    $SyncroRequest = @{
      Resource = '/tickets'
      Method = 'GET'
      Params = $Params
    }
    Invoke-SyncroRequestPaginated -SyncroRequest $SyncroRequest -Property tickets
  }
}