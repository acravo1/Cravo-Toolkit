function Invoke-CtkDiff
{
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
            Write-Host ""
            Write-Host ("[{0}]" -f $Repo.Name)
            Write-Host ""

            git diff --stat
        }
        finally
        {
            Pop-Location
        }
    }

    Write-Host ""
}