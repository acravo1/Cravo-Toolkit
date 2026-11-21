function Get-BootstrapContext
{
    param (
        [string]$File
    )

    if (-not (Test-Path $File))
    {
        return @()
    }

    $Lines = Get-Content $File

    $Capture = $false
    $Result = @()

    foreach ($Line in $Lines)
    {
        if ($Line -eq '## Bootstrap Context')
        {
            $Capture = $true
            continue
        }

        if ($Line -eq '## End Bootstrap Context')
        {
            break
        }

        if ($Capture)
        {
            $Result += $Line
        }
    }

    return $Result
}

function Get-RecentSessions
{
    param (
        [string]$SessionsPath,
        [int]$Count = 3
    )

    if (-not (Test-Path $SessionsPath))
    {
        return @()
    }

    Get-ChildItem `
        -Path $SessionsPath `
        -File `
        -Filter "*.md" |
    Where-Object {
        $_.BaseName -ne "README"
    } |
    Sort-Object LastWriteTime -Descending |
    Select-Object -First $Count
}

function Invoke-CtkContext
{
    $Root = Split-Path $PSScriptRoot -Parent

    $OutputFile = Join-Path `
        $Root `
        "00-WIP\CURRENT-CONTEXT.md"

    $Builder = @()

    $Builder += "# CURRENT CONTEXT"
    $Builder += ""
    $Builder += "Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    $Builder += ""

    #
    # PROJECTS
    #

    $Builder += "---"
    $Builder += ""
    $Builder += "# PROJECTS"
    $Builder += ""

    $ProjectsPath = Join-Path `
        $Root `
        "01-PROJECTS"

    Get-ChildItem `
        -Path $ProjectsPath `
        -Directory |
    Sort-Object Name |
    ForEach-Object {

        $Readme = Join-Path `
            $_.FullName `
            "README.md"

        if (Test-Path $Readme)
        {
            $Builder += "## $($_.Name)"
            $Builder += ""

            $Bootstrap = Get-BootstrapContext `
                -File $Readme

            if ($Bootstrap.Count -gt 0)
            {
                $Builder += $Bootstrap

                if ($Builder[-1] -ne "")
                {
                    $Builder += ""
                }
            }
            else
            {
                $Builder += "[No Bootstrap Context]"
                $Builder += ""
            }
        }
    }

    #
    # CORE
    #

    $Builder += "---"
    $Builder += ""
    $Builder += "# CORE"
    $Builder += ""

    $CorePath = Join-Path `
        $Root `
        "02-CORE"

    $CoreFiles = Get-ChildItem `
        -Path $CorePath `
        -File `
        -Filter "*.md" |
    Sort-Object Name

    $HasCoreBootstrap = $false

    foreach ($CoreFile in $CoreFiles)
    {
        $Bootstrap = Get-BootstrapContext `
            -File $CoreFile.FullName

        if ($Bootstrap.Count -gt 0)
        {
            $HasCoreBootstrap = $true

            $Builder += $Bootstrap

            if ($Builder[-1] -ne "")
            {
                $Builder += ""
            }
        }
    }

    if (-not $HasCoreBootstrap)
    {
        $Builder += "[No Bootstrap Context]"
        $Builder += ""
    }

    $Builder += ""

    #
    # RECENT SESSIONS
    #

    $Builder += "---"
    $Builder += ""
    $Builder += "# RECENT SESSIONS"
    $Builder += ""

    $SessionsPath = Join-Path `
        $Root `
        "03-SESSIONS"

    $RecentSessions = Get-RecentSessions `
        -SessionsPath $SessionsPath `
        -Count 3

    if ($RecentSessions.Count -eq 0)
    {
        $Builder += "No archived sessions found."
        $Builder += ""
    }
    else
    {
        foreach ($Session in $RecentSessions)
        {
            $Builder += "## $($Session.BaseName)"
            $Builder += ""

            $Bootstrap = Get-BootstrapContext `
                -File $Session.FullName

            if ($Bootstrap.Count -gt 0)
            {
                $Builder += $Bootstrap

                if ($Builder[-1] -ne "")
                {
                    $Builder += ""
                }
            }
            else
            {
                $Builder += "[No Bootstrap Context]"
                $Builder += ""
            }
        }
    }

    Set-Content `
        -Path $OutputFile `
        -Value $Builder

    Write-Host ""
    Write-Host "[OK] Context generated"
    Write-Host $OutputFile
}