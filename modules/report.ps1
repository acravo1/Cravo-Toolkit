function Invoke-CtkReport
{
    $Git = Get-CtkTool "git"

    $ToolkitRoot = Resolve-Path (
        Join-Path $PSScriptRoot ".."
    )

    $ReportFile = Join-Path `
        $ToolkitRoot `
        "workspace-report.txt"

    $Content = @()

    $Content += "============================================================"
    $Content += "WORKSPACE REPORT"
    $Content += "============================================================"
    $Content += ""

    $Content += "Generated:"
    $Content += (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
    $Content += ""

    #
    # Doctor
    #

    $Content += "DOCTOR"
    $Content += "------------------------------------------------------------"

    if (Test-Path $Git)
    {
        $Content += "[OK] Git available"
        $Content += "     $Git"
    }
    else
    {
        $Content += "[FAIL] Git not available"
    }

    $Content += ""

    #
    # Repository Status
    #

    $Content += "STATUS"
    $Content += "------------------------------------------------------------"

    $Repos = Get-CtkRepositories

    foreach ($Repo in $Repos)
    {
        $RepoPath = Resolve-Path (
            Join-Path `
                $PSScriptRoot `
                "..\$($Repo.Path)"
        )

        Push-Location $RepoPath

        try
        {
            $Changes = (
                & $Git status --porcelain |
                Measure-Object
            ).Count

            if ($Changes -eq 0)
            {
                $State = "CLEAN"
            }
            else
            {
                $State = "MODIFIED"
            }

            $Content += (
                "{0,-20} {1,-10} {2}" -f `
                $Repo.Name,
                $State,
                $Changes
            )
        }
        finally
        {
            Pop-Location
        }
    }

    $Content += ""

    #
    # Summary
    #

    $SummaryFile = Join-Path `
        $ToolkitRoot `
        "workspace-summary.txt"

    if (Test-Path $SummaryFile)
    {
        $Content += "SUMMARY"
        $Content += "------------------------------------------------------------"

        $SummaryContent = Get-Content $SummaryFile

        foreach ($Line in $SummaryContent)
        {
            $Content += $Line
        }

        $Content += ""
    }

    $Content | Out-File `
        -FilePath $ReportFile `
        -Encoding utf8

    Write-Host ""
    Write-Host "Report generated:"
    Write-Host $ReportFile
    Write-Host ""
}