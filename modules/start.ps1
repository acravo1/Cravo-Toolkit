function Invoke-CtkStart
{
    $Root = Split-Path $PSScriptRoot -Parent

    #
    # Load dependencies
    #

    . "$PSScriptRoot\context.ps1"

    $WipPath = Join-Path $Root "00-WIP"


    #
    # Garantir existência do workspace
    #

    if (-not (Test-Path $WipPath))
    {
        New-Item `
            -ItemType Directory `
            -Path $WipPath | Out-Null
    }

    #
    # Limpar workspace
    #

    Get-ChildItem `
        -Path $WipPath `
        -File |
    Remove-Item -Force

    Write-Host ""
    Write-Host "[OK] Workspace cleaned"

    #
    # Gerar contexto
    #

	Invoke-CtkContext

	#
	# Criar SESSION-OUTPUT.md
	#

	$SessionOutput = Join-Path `
		$WipPath `
		"SESSION-OUTPUT.md"

@"
# SESSION OUTPUT

Date: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')

## Current Focus

## Decisions Made

## Open Questions

## Next Actions

## Session Summary

## Bootstrap Context

## End Bootstrap Context
"@ | Set-Content $SessionOutput

	Write-Host ""
	Write-Host "[OK] Session output created"
	Write-Host $SessionOutput

    Write-Host "[OK] Session output created"

    Write-Host ""
    Write-Host "Workspace Ready"
    Write-Host ""
    Write-Host "Files:"
    Write-Host "  00-WIP\CURRENT-CONTEXT.md"
    Write-Host "  00-WIP\SESSION-OUTPUT.md"
}