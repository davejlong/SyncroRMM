function Get-SyncroAppointmentType {
  <#
  .SYNOPSIS
  Gets Appointment Types from Syncro API

  .DESCRIPTION
  Retrieves Appointment Types from Syncro API

  .PARAMETER Id
  ID of appointment type to retrieve

  .EXAMPLE
  # Retrieve a single appointment type by ID
  Get-SyncroAppointmentType -Id 12345

  .EXAMPLE
  # Retrieve all appointment types
  Get-SyncroAppointmentType

  .NOTES
  Required permission: Global Admin
  #>
  [CmdletBinding()]
  param (
    [ValidateRange(1, [Int]::MaxValue)]
    [Int] $Id
  )
  $Resource = "/appointment_types"

  if ($Id) {
    $SyncroRequest = @{
      Resource = "$Resource/$Id"
      Method = 'GET'
    }
    Invoke-SyncroRequest @SyncroRequest
  } else {
    $Params = @{}

    $SyncroRequest = @{
      Resource = "$Resource"
      Method = 'GET'
      Params = $Params
    }
    Invoke-SyncroRequestPaginated -SyncroRequest $SyncroRequest -Property appointment_types
  }
}
