function Invoke-SyncroRequest {
  <#
  .SYNOPSIS
  Main SyncroRMM API function

  .DESCRIPTION
  Calls SyncroRMM API with token

  .PARAMETER Method
  GET,POST,DELETE,PUT,etc

  .PARAMETER Resource
  Path to API endpoint

  .PARAMETER Params
  Hashtable of parameters

  .PARAMETER Body
  JSON encoded body string

  .PARAMETER Form
  Multipart form data

  .EXAMPLE
  Invoke-SyncroRequest -Resource /customer_assets
  #>

  [CmdletBinding()]
  param (
      [string] $Method = 'GET',
      [ValidateNotNullOrEmpty()]
      [string] $Resource,
      [hashtable] $Params = @{},
      [string] $Body,
      [hashtable] $Form
  )

  $SyncroAPIKey = Get-SyncroAPIKey
  $SyncroSubdomain = Get-syncroSubdomain

  # Assemble parameters
  $ParamCollection = [System.Web.HttpUtility]::ParseQueryString([String]::Empty)

  # Sort parameters
  foreach ($Item in ($Params.GetEnumerator() | Sort-Object -CaseSensitive -Property Key)) {
    $ParamCollection.Add($Item.Key, $Item.Value)
  }

  # Query string
  $Request = $ParamCollection.ToString()

  $Headers = @{
    'Authorization' = (New-Object PSCredential 'user', $SyncroAPIKey).GetNetworkCredential().Password;
  }

  if (($Script::Int_SyncroCustomHeaders | Measure-Object).count -gt 0) {
    foreach ($Entry in $Int_SyncroCustomHeaders.GetEnumerator()) {
      $Headers[$Entry.Name] = $Entry.Value
    }
  }

  $ContentType = 'application/json; charset=utf-8'

  $Uri = 'https://{0}.syncromsp.com/api/v1{1}' -f $SyncroSubdomain, $Resource
  # Make the API call URI
  if ($Request) {
    $UriBuilder = [System.UriBuilder]$Uri
    $UriBuilder.Query = $Request
    $Uri = $UriBuilder.Uri
  }
  Write-Verbose ('{0} [{1}]' -f $Method, $Uri)

  $RestMethod = @{
    Method = $Method
    Uri = $Uri
    Headers = $Headers
    ContentType = $ContentType
  }

  if ($Body) {
    $RestMethod.Body = $Body
    Write-Verbose $Body
  }

  if ($Form) {
    $RestMethod.Form = $Form
    Write-Verbose ($Form | Out-String)
  }

  try {
    $Results = Invoke-RestMethod @RestMethod
  } catch {
    if ("$_".trim() -eq 'Retry later' -or "$_".trim() -eq 'The remote server returned an error: (429) Too Many Requests.') {
      Write-Information 'SyncroRMM API Rate limited. Waiting 30 Seconds then trying again'
      Start-Sleep 30
      $Results = Invoke-SyncroRequest @RestMethod
    } else {
      Write-Error "'$_'"
    }
  }

  $Results
}