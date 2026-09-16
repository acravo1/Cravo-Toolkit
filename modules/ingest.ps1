function Invoke-CtkIngest
{
    param(
        [string]$File
    )

    if (-not (Test-Path $File))
    {
        throw "File not found: $File"
    }

    $Root = Split-Path $PSScriptRoot -Parent

    $MapFile = Join-Path $Root "config\ingest-map.json"

    if (-not (Test-Path $MapFile))
    {
        throw "Mapping file not found: $MapFile"
    }

    $Map = Get-Content $MapFile -Raw | ConvertFrom-Json

    $Lines = Get-Content $File

    $CurrentTarget = $null
    $Buffer = @()

    foreach ($Line in $Lines)
    {
        if ($Line -match "^TARGET:\s*(.+)$")
        {
            if ($CurrentTarget -and $Buffer.Count -gt 0)
            {
                Write-CtkIngestBlock `
                    -Target $CurrentTarget `
                    -Content $Buffer `
                    -Map $Map
            }

            $CurrentTarget = $Matches[1].Trim()
            $Buffer = @()

            continue
        }

        if ($CurrentTarget)
        {
            $Buffer += $Line
        }
    }

    if ($CurrentTarget -and $Buffer.Count -gt 0)
    {
        Write-CtkIngestBlock `
            -Target $CurrentTarget `
            -Content $Buffer `
            -Map $Map
    }
}

function Write-CtkIngestBlock
{
    param(
        [string]$Target,
        [array]$Content,
        $Map
    )

    $Destination = $Map.PSObject.Properties[$Target].Value

    if (-not $Destination)
    {
        Write-Warning "Unknown target: $Target"
        return
    }

    $Root = Split-Path $PSScriptRoot -Parent

    $Destination = Join-Path $Root $Destination

    $Parent = Split-Path $Destination -Parent

    if (-not (Test-Path $Parent))
    {
        New-Item `
            -ItemType Directory `
            -Force `
            -Path $Parent | Out-Null
    }

    if (-not (Test-Path $Destination))
    {
        New-Item `
            -ItemType File `
            -Force `
            -Path $Destination | Out-Null
    }

    Add-Content -Path $Destination -Value ""
    Add-Content -Path $Destination -Value ("## Imported " + (Get-Date))
    Add-Content -Path $Destination -Value $Content

    Write-Host "[OK] $Target -> $Destination"
}