function Get-SyncroAppointment {
  <#
  .SYNOPSIS
  Gets Appointments from Syncro API

  .DESCRIPTION
  Retrieves Appointments from Syncro API

  .PARAMETER Id
  ID of appointment to retrieve

  .EXAMPLE
  # Retrieve a single appointment by ID
  Get-SyncroAppointment -Id 12345

  .EXAMPLE
  # Retrieve all appointments
  Get-SyncroAppointment
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
