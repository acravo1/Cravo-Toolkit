function Get-CtkRepositories
{
    $ConfigPath = Join-Path `
        $PSScriptRoot `
        "..\config\repositories.json"

    $ConfigPath = Resolve-Path $ConfigPath

    $Config = Get-Content `
        $ConfigPath `
        -Raw |
        ConvertFrom-Json

    return $Config.repositories
}
