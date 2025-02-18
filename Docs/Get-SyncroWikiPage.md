---
external help file: SyncroRMM-help.xml
Module Name: SyncroRMM
online version:
schema: 2.0.0
---

# Get-SyncroWikiPage

## SYNOPSIS
Gets Wiki Pages from Syncro API

## SYNTAX

```
Get-SyncroWikiPage [[-Id] <Int32>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Retrieves wiki pages from Syncro API

## EXAMPLES

### EXAMPLE 1
```
# Retrieve a single wiki_page by ID
Get-SyncroWikiPage -Id 12345
```

### EXAMPLE 2
```
# Retrieve all wiki_pages
Get-SyncroWikiPage
```

## PARAMETERS

### -Id
ID of wiki page to retrieve

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
