function Get-SyncroSubdomain {
    <#
    .SYNOPSIS
    Get SyncroRMM Base URL

    .DESCRIPTION
    Returns SyncroRMM Base URL

    .EXAMPLE
    Get-SyncroSubdomain

    #>
    [CmdletBinding()]
    Param()
    if ($null -eq $Int_SyncroSubdomain) {
        Write-Error 'No subdomain has been set. Please use Set-SyncroSubdomain to set it.'
    } else {
        $Int_SyncroSubdomain
    }
}