function Invoke-SyncroRequestPaginated {
    <#
    .SYNOPSIS
    Paginated requests to SyncroRMM API

    .DESCRIPTION
    Wraps Invoke-SyncroRequest with page sizes

    .PARAMETER SyncroRequest
    Request to paginate

    .PARAMETER Property
    Property name to return (don't specify to return entire response object)

    .PARAMETER PageSize
    Number of results to expect per page (default 25)

    #>
    [CmdletBinding()]
    Param(
        [hashtable]$SyncroRequest,
        [string]$Property
    )

    $i = 1
    do {
      $SyncroRequest.Params.page = $i
      # $HuduRequest.Params.page_size = $PageSize
      $Response = Invoke-SyncroRequest @SyncroRequest

      Write-Verbose ("Got page {0} of {1}" -f $Response.meta.page, $Response.meta.total_pages)
      $i++
      if ($Property) {
        $Response.$Property
      } else {
        $Response
      }
    } while ($Property -and ($Response.meta.page -lt $Response.meta.total_pages))
}