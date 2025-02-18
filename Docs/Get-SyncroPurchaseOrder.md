---
external help file: SyncroRMM-help.xml
Module Name: SyncroRMM
online version:
schema: 2.0.0
---

# Get-SyncroPurchaseOrder

## SYNOPSIS
Gets Purchase Orders from Syncro API

## SYNTAX

```
Get-SyncroPurchaseOrder [[-Id] <Int32>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Retrieves purchase orders from Syncro API

## EXAMPLES

### EXAMPLE 1
```
# Retrieve a single purchase order by ID
Get-SyncroPurchaseOrder -Id 12345
```

### EXAMPLE 2
```
# Retrieve all purchase orders
Get-SyncroPurchaseOrder
```

## PARAMETERS

### -Id
ID of purchase order to retrieve

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
