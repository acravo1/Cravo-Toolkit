function Write-CtkLog
{
    param(
        [string]$Message
    )

    Write-Host ("[{0}] {1}" -f (Get-Date -Format "HH:mm:ss"), $Message)
}

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

    $StartTime = Get-Date

    Write-Host ""
    Write-Host "======================================="
    Write-Host "CTK EXPORT"
    Write-Host "======================================="
    Write-Host ""

    Write-CtkLog "Export started"
    Write-CtkLog ("Repositories found: {0}" -f $Repos.Count)

    Write-Host ""

    $Counter = 0

    foreach ($Repo in $Repos)
    {
        $Counter++

        Write-CtkLog (
            "Repository {0}/{1}: {2}" -f `
            $Counter, `
            $Repos.Count, `
            $Repo.Name
        )

        $RepoStart = Get-Date

        try
        {
            Invoke-CtkExport $Repo.Name

            $RepoElapsed = (Get-Date) - $RepoStart

            Write-CtkLog (
                "Completed {0} ({1:N1}s)" -f `
                $Repo.Name, `
                $RepoElapsed.TotalSeconds
            )
        }
        catch
        {
            Write-CtkLog (
                "FAILED {0}" -f `
                $Repo.Name
            )

            Write-CtkLog ($_.Exception.Message)
        }

        Write-Host ""
    }

    Write-CtkLog "Starting consolidation"

    Get-ChildItem `
        $LatestFolder `
        -Filter "*_export.txt" `
        -ErrorAction SilentlyContinue |
    Remove-Item -Force

    $FilesCopied = 0

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

            $FilesCopied++

            Write-CtkLog (
                "Copied export: {0}" -f `
                $_.Name
            )
        }
    }

    $Duration = (Get-Date) - $StartTime

    Write-Host ""

    Write-CtkLog ("Exports copied: {0}" -f $FilesCopied)
    Write-CtkLog "Consolidation complete"
    Write-CtkLog ("Location: {0}" -f $LatestFolder)
    Write-CtkLog ("Duration: $($Duration.ToString('hh\:mm\:ss'))")

    Write-Host ""
}