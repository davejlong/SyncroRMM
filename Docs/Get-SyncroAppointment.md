---
external help file: SyncroRMM-help.xml
Module Name: SyncroRMM
online version:
schema: 2.0.0
---

# Get-SyncroAppointment

## SYNOPSIS
Gets Appointments from Syncro API

## SYNTAX

```
Get-SyncroAppointment [[-Id] <Int64>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Retrieves Appointments from Syncro API

## EXAMPLES

### EXAMPLE 1
```
# Retrieve a single appointment by ID
Get-SyncroAppointment -Id 12345
```

### EXAMPLE 2
```
# Retrieve all appointments
Get-SyncroAppointment
```

## PARAMETERS

### -Id
ID of appointment to retrieve

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
