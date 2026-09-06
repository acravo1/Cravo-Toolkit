function Invoke-CtkLogbook
{
    $ToolkitRoot = Resolve-Path (
        Join-Path $PSScriptRoot ".."
    )

    $LogbookFolder = Join-Path `
        $ToolkitRoot `
        "logbook"

    if (-not (Test-Path $LogbookFolder))
    {
        New-Item `
            -ItemType Directory `
            -Path $LogbookFolder | Out-Null
    }

    $DateStamp = Get-Date -Format "yyyy-MM-dd"

    $LogbookFile = Join-Path `
        $LogbookFolder `
        "$DateStamp-logbook.md"

    if (Test-Path $LogbookFile)
    {
        Write-Host ""
        Write-Host "Logbook already exists:"
        Write-Host $LogbookFile
        Write-Host ""

        return
    }

    $Template = @(
        "# Logbook Entry"
        ""
        "Date:"
        ""
        "$DateStamp"
        ""
        "Project:"
        ""
        ""
        "Type:"
        ""
        ""
        "---"
        ""
        "## Context"
        ""
        ""
        "---"
        ""
        "## Activity"
        ""
        ""
        "---"
        ""
        "## Discoveries"
        ""
        ""
        "---"
        ""
        "## Conclusions"
        ""
        ""
        "---"
        ""
        "## Decisions"
        ""
        ""
        "---"
        ""
        "## Risks"
        ""
        ""
        "---"
        ""
        "## Next Actions"
        ""
        ""
        "---"
        ""
        "## Promote To ADR"
        ""
        "- [ ]"
        ""
        "---"
        ""
        "## Promote To Knowledge"
        ""
        "- [ ]"
        ""
        "---"
        ""
        "## Promote To Current State"
        ""
        "- [ ]"
        ""
        "---"
        ""
        "## Session Summary"
        ""
        ""
        "---"
        ""
        "## One Sentence Summary"
        ""
        ""
    )

    $Template | Out-File `
        -FilePath $LogbookFile `
        -Encoding utf8

    Write-Host ""
    Write-Host "Logbook created:"
    Write-Host $LogbookFile
    Write-Host ""
}