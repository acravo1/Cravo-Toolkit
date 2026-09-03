function Invoke-CtkStatus
{
    param(
        [switch]$VerboseMode
    )

    $Repos = Get-CtkRepositories

    Write-Host ""

    Write-Host (
        "{0,-20} {1,-10} {2}" -f `
        "REPOSITORY",
        "STATUS",
        "CHANGES"
    )

    Write-Host (
        "{0,-20} {1,-10} {2}" -f `
        "----------",
        "------",
        "-------"
    )

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
            $GitChanges = git status --porcelain

            $Changes = ($GitChanges | Measure-Object).Count

            if ($Changes -eq 0)
            {
                $Status = "CLEAN"
            }
            else
            {
                $Status = "MODIFIED"
            }

            Write-Host (
                "{0,-20} {1,-10} {2}" -f `
                $Repo.Name,
                $Status,
                $Changes
            )

            if ($VerboseMode -and $Changes -gt 0)
            {
                Write-Host ""

                foreach ($Line in $GitChanges)
                {
                    Write-Host ("    $Line")
                }

                Write-Host ""
            }
        }
        finally
        {
            Pop-Location
        }
    }

    Write-Host ""
}