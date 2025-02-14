---
external help file: SyncroRMM-help.xml
Module Name: SyncroRMM
online version:
schema: 2.0.0
---

# Get-SyncroTicket

## SYNOPSIS
Gets tickets from SyncroRMM

## SYNTAX

```
Get-SyncroTicket [[-Id] <Int32>] [[-CustomerId] <Int32>] [[-ContactId] <Int32>] [[-UserId] <Int32>]
 [[-TicketSearchId] <Int32>] [[-Number] <Int32>] [[-Status] <TicketSatus>] [[-ResolvedAfter] <DateTime>]
 [[-CreatedAfter] <DateTime>] [[-SinceUpdatedAt] <DateTime>] [[-Query] <String>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Retrieves ticket details from the SyncroRMM API

## EXAMPLES

### EXAMPLE 1
```
# Get a ticket by it's ID
Get-SyncroTicket -Id 12345
```

## PARAMETERS

### -Id
ID of a specific ticket to retrieve

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

### -CustomerId
Customer ID to retrieve tickets for

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -ContactId
{{ Fill ContactId Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserId
Retreive tickets assigned to a specific user

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -TicketSearchId
Retrieve tickets for a saved search

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Number
Retrieve ticket by the ticket number

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Status
Retrieve tickets based on their status

```yaml
Type: TicketSatus
Parameter Sets: (All)
Aliases:
Accepted values: New, InProgress, Resolved, Invoiced, WaitingForParts, WaitingOnCustomer, Scheduled, CustomerReply, NotClosed

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResolvedAfter
Retrieve tickets resolved after a specific date

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases: resolved_after

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CreatedAfter
Retrieve tickets created after a specific date

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases: created_after

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SinceUpdatedAt
Retrieve tickets updated after a specific date

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases: sinced_updated_at

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Query
Generic search terms to search for tickets

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: None
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
