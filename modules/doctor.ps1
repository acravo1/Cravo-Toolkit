function Invoke-CtkDoctor
{
    $Repos = Get-CtkRepositories

    Write-Host ""
    Write-Host "CTK Doctor"
    Write-Host ""

    #
    # Git
    #

    $Git = Get-CtkTool "git"

    if (Test-Path $Git)
    {
        Write-Host "[OK] Git available"
        Write-Host ("     {0}" -f $Git)
    }
    else
    {
        Write-Host "[FAIL] Git not found"
    }

    #
    # Folders
    #

    $Settings = Get-CtkSettings

    $ToolkitRoot = Resolve-Path (
        Join-Path $PSScriptRoot ".."
    )

    $ExportsFolder = Join-Path `
        $ToolkitRoot `
        $Settings.exportFolder

    $SnapshotsFolder = Join-Path `
        $ToolkitRoot `
        $Settings.snapshotFolder

    if (Test-Path $ExportsFolder)
    {
        Write-Host "[OK] exports"
    }
    else
    {
        Write-Host "[FAIL] exports"
    }

    if (Test-Path $SnapshotsFolder)
    {
        Write-Host "[OK] snapshots"
    }
    else
    {
        Write-Host "[FAIL] snapshots"
    }

    #
    # Repositories
    #

    Write-Host ""
    Write-Host "Repositories"
    Write-Host ""

    foreach ($Repo in $Repos)
    {
        $RepoPath = Resolve-Path (
            Join-Path `
                $PSScriptRoot `
                "..\$($Repo.Path)"
        )

        $GitFolder = Join-Path $RepoPath ".git"

        $ExportScript = Join-Path `
            $RepoPath `
            "tools\export.ps1"

        $Status = "OK"

        if (-not (Test-Path $GitFolder))
        {
            $Status = "NO GIT"
        }

        if (-not (Test-Path $ExportScript))
        {
            $Status = "NO EXPORT"
        }

        Write-Host (
            "{0,-20} {1}" -f `
            $Repo.Name,
            $Status
        )
    }

    Write-Host ""
}