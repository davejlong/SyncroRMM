function Get-SyncroWikiPage {
  <#
  .SYNOPSIS
  Gets Wiki Pages from Syncro API

  .DESCRIPTION
  Retrieves wiki pages from Syncro API

  .PARAMETER Id
  ID of wiki page to retrieve

  .EXAMPLE
  # Retrieve a single wiki_page by ID
  Get-SyncroWikiPage -Id 12345

  .EXAMPLE
  # Retrieve all wiki_pages
  Get-SyncroWikiPage
  #>
  [CmdletBinding()]
  param (
    [ValidateRange(1, [Int]::MaxValue)]
    [Int] $Id
  )
  $Resource = "/wiki_pages"

  if ($Id) {
    $SyncroRequest = @{
      Resource = "$Resource/$Id"
      Method = 'GET'
    }
    Invoke-SyncroRequest @SyncroRequest | Select-Object -ExpandProperty wiki_page
  } else {
    $Params = @{}

    $SyncroRequest = @{
      Resource = "$Resource"
      Method = 'GET'
      Params = $Params
    }
    Invoke-SyncroRequestPaginated -SyncroRequest $SyncroRequest -Property wiki_pages
  }
}
