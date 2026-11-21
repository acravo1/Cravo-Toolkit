function Get-CtkRepositories
{
    $Root = Split-Path $PSScriptRoot -Parent

    $ProjectsPath = Join-Path $Root "01-PROJECTS"

    if (-not (Test-Path $ProjectsPath))
    {
        throw "Projects folder not found: $ProjectsPath"
    }

    Get-ChildItem `
        -Path $ProjectsPath `
        -Directory |
    Where-Object {
        Test-Path (
            Join-Path $_.FullName "README.md"
        )
    } |
    ForEach-Object {

        [PSCustomObject]@{
            Name = $_.Name
            Path = $_.FullName
        }
    }
}

function Show-CtkRepositories
{
    $Repositories = Get-CtkRepositories

    Write-Host ""
    Write-Host "Discovered Projects"
    Write-Host "-------------------"

    foreach ($Repository in $Repositories)
    {
        Write-Host $Repository.Name
    }

    Write-Host ""
    Write-Host ("Total: " + $Repositories.Count)
}