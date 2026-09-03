function Get-CtkSettings
{
    $SettingsPath = Join-Path `
        $PSScriptRoot `
        "..\config\settings.json"

    return (
        Get-Content `
            $SettingsPath `
            -Raw |
            ConvertFrom-Json
    )
}

function Get-CtkTool
{
    param(
        [string]$Name
    )

    $Settings = Get-CtkSettings

    return $Settings.tools.$Name
}