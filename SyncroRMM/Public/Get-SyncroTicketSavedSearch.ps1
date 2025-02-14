function Get-SyncroTicketSavedSearch {
  <#
  .SYNOPSIS
  Get saved ticket searches

  .DESCRIPTION
  Gets a list of saved ticket searches
  #>

  $Settings = Get-SyncroTicketSettings

  $Searches = @{}
  foreach($Search in $Settings.saved_searches.GetEnumerator()) {
    $Searches[[string]$Search.id] = $Search.name
  }

  $Searches
}