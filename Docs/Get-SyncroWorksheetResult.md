---
external help file: SyncroRMM-help.xml
Module Name: SyncroRMM
online version:
schema: 2.0.0
---

# Get-SyncroWorksheetResult

## SYNOPSIS
Gets Worksheet Results from Syncro API

## SYNTAX

```
Get-SyncroWorksheetResult [[-Id] <Int32>] [-TicketId] <Int32> [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Retrieves worksheet results from Syncro API

## EXAMPLES

### EXAMPLE 1
```
# Retrieve a single worksheet result by ID
Get-SyncroWorksheetResult -TicketId 98765 -Id 12345
```

### EXAMPLE 2
```
# Retrieve all worksheet results for a ticket
Get-SyncroWorksheetResult -TicketId 12345
```

## PARAMETERS

### -Id
ID of worksheet result to retrieve

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -TicketId
Ticket ID to pull worksheets for

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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
