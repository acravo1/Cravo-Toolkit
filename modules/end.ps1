function Invoke-CtkEnd
{
    $Git = Get-CtkTool "git"

    $Repos = Get-CtkRepositories

    Write-Host ""
    Write-Host "====================================="
    Write-Host "CTK END OF DAY"
    Write-Host "====================================="
    Write-Host ""

    Invoke-CtkStatus

    Write-Host ""
    Write-Host "Creating checkpoint..."
    Write-Host ""

    Invoke-CtkCheckpoint

    Write-Host ""

    $Confirm = Read-Host "Proceed with commit and push? (Y/N)"

    if ($Confirm -ne "Y")
    {
        Write-Host ""
        Write-Host "Operation cancelled."
        Write-Host ""

        return
    }

    foreach ($Repo in $Repos)
    {
        $RepoPath = Resolve-Path (
            Join-Path $PSScriptRoot "..\$($Repo.Path)"
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
                continue
            }

            Write-Host ""
            Write-Host ("Processing {0}" -f $Repo.Name)

            & $Git add .

            & $Git commit `
                -m ("Daily Update {0}" -f (
                    Get-Date -Format "yyyy-MM-dd"
                ))

            & $Git push
        }
        finally
        {
            Pop-Location
        }
    }

    Write-Host ""
    Write-Host "End of day completed."
    Write-Host ""
}