function Get-SyncroAppointment {
  <#
  .SYNOPSIS
  Gets Appointments from Syncro API

  .DESCRIPTION
  Retrieves Appointments from Syncro API

  .PARAMETER Id
  ID of appointment to retrieve

  .EXAMPLE
  Get-SyncroAppointment -Id 12345
  # Retrieve a single appointment by ID

  .EXAMPLE
  Get-SyncroAppointment
  # Retrieve all appointments

  .NOTES
  Required permission: Appointments - View All (see-own never restricted)
  #>
  [CmdletBinding()]
  param (
    [ValidateRange(1, [Int64]::MaxValue)]
    [Int64] $Id
  )
  $Resource = "/appointments"

  if ($Id) {
    $SyncroRequest = @{
      Resource = "$Resource/$Id"
      Method = 'GET'
    }
    Invoke-SyncroRequest @SyncroRequest | Select-Object -ExpandProperty appointment
  } else {
    $Params = @{}

    $SyncroRequest = @{
      Resource = "$Resource"
      Method = 'GET'
      Params = $Params
    }
    Invoke-SyncroRequestPaginated -SyncroRequest $SyncroRequest -Property appointments
  }
}
