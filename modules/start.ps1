function Invoke-CtkStart
{
    $Git = Get-CtkTool "git"

    $Repos = Get-CtkRepositories

    Write-Host ""
    Write-Host "CTK START"
    Write-Host ""

    Write-Host (
        "{0,-20} {1,-10}" -f
        "REPOSITORY",
        "STATUS"
    )

    Write-Host (
        "{0,-20} {1,-10}" -f
        "----------",
        "------"
    )

    foreach ($Repo in $Repos)
    {
        $RepoPath = Resolve-Path (
            Join-Path $PSScriptRoot "..\$($Repo.Path)"
        )

        Push-Location $RepoPath

        try
        {
            & $Git fetch | Out-Null
            & $Git pull  | Out-Null

            Write-Host (
                "{0,-20} {1,-10}" -f
                $Repo.Name,
                "UPDATED"
            )
        }
        finally
        {
            Pop-Location
        }
    }

    Write-Host ""
    Write-Host "Workspace synchronized."
    Write-Host ""
}