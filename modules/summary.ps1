function Invoke-CtkSummary
{
    $ToolkitRoot = Resolve-Path (
        Join-Path $PSScriptRoot ".."
    )

    $ExportFolder = Join-Path $ToolkitRoot "exports\latest"

    $OutputFile = Join-Path `
        $ToolkitRoot `
        "workspace-summary.txt"

    $Files = Get-ChildItem `
        $ExportFolder `
        -Filter "*_export.txt" `
        -ErrorAction SilentlyContinue

    $Content = @()

    $Content += "============================================================"
    $Content += "WORKSPACE SUMMARY"
    $Content += "============================================================"
    $Content += ""

    $Content += "Generated:"
    $Content += (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
    $Content += ""

    $Content += "EXPORT FILES"
    $Content += "------------------------------------------------------------"
    $Content += ""

    foreach ($File in $Files)
    {
        $Content += $File.Name
    }

    $Content += ""

    $Content += "TOTAL EXPORTS"
    $Content += "------------------------------------------------------------"
    $Content += ""

    $Content += $Files.Count

    $Content | Out-File `
        -FilePath $OutputFile `
        -Encoding utf8

    Write-Host ""
    Write-Host "Summary generated:"
    Write-Host $OutputFile
    Write-Host ""
}
