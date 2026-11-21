function Invoke-CtkDiff
{
    $Repos = Get-CtkRepositories

	$Git = Get-CtkTool "git"

	Write-Host ""
	Write-Host "Git:"
	Write-Host $Git
	Write-Host ""

    foreach ($Repo in $Repos)
    {
        $RepoPath = Resolve-Path $Repo.Path

        Push-Location $RepoPath

        try
        {
            Write-Host ""
            Write-Host ("[{0}]" -f $Repo.Name)
            Write-Host ""

            & $Git diff --stat
        }
        finally
        {
            Pop-Location
        }
    }

    Write-Host ""
}
