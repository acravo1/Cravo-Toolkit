function Invoke-CtkExport
{
    param(
        [string]$RepositoryName
    )

    $Repos = Get-CtkRepositories

    $Repo = $Repos |
        Where-Object {
            $_.Name -ieq $RepositoryName
        }

    if (-not $Repo)
    {
        Write-Host ""
        Write-Host "Repository not found: $RepositoryName"
        Write-Host ""

        return
    }

    $RepoPath = Resolve-Path (
        Join-Path `
        $PSScriptRoot `
        "..\$($Repo.Path)"
    )

    $ExportScript = Join-Path `
        $RepoPath `
        "tools\export.ps1"

    if (-not (Test-Path $ExportScript))
    {
        Write-Host ""
        Write-Host "Export script not found."
        Write-Host ""

        return
    }

    Write-Host ""
    Write-Host ("Exporting {0}" -f $Repo.Name)
    Write-Host ""

    Push-Location $RepoPath

    try
    {
        & $ExportScript
    }
    finally
    {
        Pop-Location
    }
}

function Invoke-CtkExportAll
{
    $Repos = Get-CtkRepositories

    $ToolkitRoot = Resolve-Path (
        Join-Path $PSScriptRoot ".."
    )

    $LatestFolder = Join-Path `
        $ToolkitRoot `
        "exports\latest"

    New-Item `
        -ItemType Directory `
        -Force `
        -Path $LatestFolder | Out-Null

    Write-Host ""
    Write-Host "Running exports..."
    Write-Host ""

    foreach ($Repo in $Repos)
    {
        Invoke-CtkExport $Repo.Name
    }

    Write-Host ""
    Write-Host "Consolidating exports..."
    Write-Host ""

    Get-ChildItem `
        $LatestFolder `
        -Filter "*_export.txt" `
        -ErrorAction SilentlyContinue |
    Remove-Item -Force

    foreach ($Repo in $Repos)
    {
        $RepoPath = Resolve-Path (
            Join-Path `
                $ToolkitRoot `
                $Repo.Path
        )

        $ExportFolder = Join-Path `
            $RepoPath `
            "exports"

        Get-ChildItem `
            $ExportFolder `
            -Filter "*_export.txt" `
            -ErrorAction SilentlyContinue |
        ForEach-Object {

            Copy-Item `
                $_.FullName `
                $LatestFolder `
                -Force

            Write-Host ("Copied {0}" -f $_.Name)
        }
    }

    Write-Host ""
    Write-Host "Consolidation complete."
    Write-Host ("Location: {0}" -f $LatestFolder)
    Write-Host ""
}