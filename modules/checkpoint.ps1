function Invoke-CtkCheckpoint
{
    Invoke-CtkExportAll

    $ToolkitRoot =
        Resolve-Path (
            Join-Path $PSScriptRoot ".."
        )

    $Timestamp =
        Get-Date -Format "yyyy-MM-dd_HHmm"

    $LatestFolder =
        Join-Path $ToolkitRoot "exports\latest"

    $SnapshotFolder =
        Join-Path `
            $ToolkitRoot `
            "snapshots\$Timestamp"

    New-Item `
        -ItemType Directory `
        -Force `
        -Path $SnapshotFolder | Out-Null

    Copy-Item `
        "$LatestFolder\*" `
        $SnapshotFolder `
        -Recurse `
        -Force

    Write-Host ""
    Write-Host "Checkpoint created:"
    Write-Host $SnapshotFolder
    Write-Host ""
}