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
    if ($null -eq $Int_SyncroAPIKey) {
        Write-Error 'No API key has been set. Please use Set-SyncroAPIKey to set it.'
    } else {
        $Int_SyncroAPIKey
    }
}