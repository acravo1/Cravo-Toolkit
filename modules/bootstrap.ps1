function Invoke-CtkBootstrap
{
    $ToolkitRoot = Resolve-Path (
        Join-Path $PSScriptRoot ".."
    )

    $GeneratedFolder = Join-Path `
        $ToolkitRoot `
        "generated"

    if (-not (Test-Path $GeneratedFolder))
    {
        New-Item `
            -ItemType Directory `
            -Path $GeneratedFolder | Out-Null
    }

    $OutputFile = Join-Path `
        $GeneratedFolder `
        "bootstrap-context.md"

    $Content = @()

    $Content += "# Bootstrap Context"
    $Content += ""
    $Content += ("Generated: {0}" -f `
        (Get-Date -Format "yyyy-MM-dd HH:mm:ss"))
    $Content += ""

    #
    # Current State
    #

    $CurrentStateFolder = Join-Path `
        $ToolkitRoot `
        "current-state"

    if (Test-Path $CurrentStateFolder)
    {
        $Content += "============================================================"
        $Content += "CURRENT STATE"
        $Content += "============================================================"
        $Content += ""

        Get-ChildItem `
            $CurrentStateFolder `
            -Filter "*.md" |
        Sort-Object Name |
        ForEach-Object {

            $Content += ""
            $Content += ("FILE: {0}" -f $_.Name)
            $Content += ""

            $Content += Get-Content `
                $_.FullName `
                -Encoding UTF8

            $Content += ""
        }
    }

    #
    # Recent Logbooks
    #

    $LogbookFolder = Join-Path `
        $ToolkitRoot `
        "logbook"

    if (Test-Path $LogbookFolder)
    {
        $Content += ""
        $Content += "============================================================"
        $Content += "RECENT LOGBOOKS"
        $Content += "============================================================"
        $Content += ""

        Get-ChildItem `
            $LogbookFolder `
            -Filter "*.md" |
        Sort-Object LastWriteTime -Descending |
        Select-Object -First 5 |
        ForEach-Object {

            $Content += ""
            $Content += ("FILE: {0}" -f $_.Name)
            $Content += ""

            $Content += Get-Content `
                $_.FullName `
                -Encoding UTF8

            $Content += ""
        }
    }

    #
    # Recent Knowledge
    #

    $KnowledgeFolder = Join-Path `
        $ToolkitRoot `
        "knowledge"

    if (Test-Path $KnowledgeFolder)
    {
        $Content += ""
        $Content += "============================================================"
        $Content += "KNOWLEDGE"
        $Content += "============================================================"
        $Content += ""

        Get-ChildItem `
            $KnowledgeFolder `
            -Filter "*.md" |
        Sort-Object LastWriteTime -Descending |
        Select-Object -First 10 |
        ForEach-Object {

            $Content += ""
            $Content += ("FILE: {0}" -f $_.Name)
            $Content += ""

            $Content += Get-Content `
                $_.FullName `
                -Encoding UTF8

            $Content += ""
        }
    }

    #
    # ADRs
    #

    $AdrFolder = Join-Path `
        $ToolkitRoot `
        "adr"

    if (Test-Path $AdrFolder)
    {
        $Content += ""
        $Content += "============================================================"
        $Content += "ADRS"
        $Content += "============================================================"
        $Content += ""

        Get-ChildItem `
            $AdrFolder `
            -Filter "*.md" |
        Sort-Object LastWriteTime -Descending |
        Select-Object -First 10 |
        ForEach-Object {

            $Content += ""
            $Content += ("FILE: {0}" -f $_.Name)
            $Content += ""

            $Content += Get-Content `
                $_.FullName `
                -Encoding UTF8

            $Content += ""
        }
    }

    $Content | Out-File `
        -FilePath $OutputFile `
        -Encoding utf8

    Write-Host ""
    Write-Host "Bootstrap created:"
    Write-Host $OutputFile
    Write-Host ""
}