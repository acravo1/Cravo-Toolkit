function Invoke-CtkIngest
{
    $Root = Split-Path $PSScriptRoot -Parent

    $SessionOutput = Join-Path `
        $Root `
        "00-WIP\SESSION-OUTPUT.md"

    if (-not (Test-Path $SessionOutput))
    {
        Write-Host ""
        Write-Host "[ERROR] SESSION-OUTPUT.md not found"
        return
    }

    $SessionsPath = Join-Path `
        $Root `
        "03-SESSIONS"

    if (-not (Test-Path $SessionsPath))
    {
        New-Item `
            -ItemType Directory `
            -Force `
            -Path $SessionsPath | Out-Null
    }

    $Timestamp = Get-Date `
        -Format "yyyy-MM-dd-HHmmss"

    $Destination = Join-Path `
        $SessionsPath `
        "$Timestamp.md"

    Copy-Item `
        -Path $SessionOutput `
        -Destination $Destination `
        -Force

    Remove-Item `
        -Path $SessionOutput `
        -Force

    Write-Host ""
    Write-Host "[OK] Session archived"
    Write-Host $Destination

    Write-Host ""
    Write-Host "[OK] SESSION-OUTPUT removed"

    Write-Host ""
    Write-Host "Next step:"
    Write-Host "  ctk start"
}