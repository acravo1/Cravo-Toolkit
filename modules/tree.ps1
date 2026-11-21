function Invoke-CtkTree
{
    $Root = Split-Path $PSScriptRoot -Parent

    $Output = Join-Path $Root "00-WIP\TREE.txt"

    tree $Root /F /A > $Output

    Write-Host ""
    Write-Host "[OK] Repository tree generated"
    Write-Host ""
    Write-Host "Output:"
    Write-Host $Output
}