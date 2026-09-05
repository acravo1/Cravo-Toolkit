# ============================================================
# generate-mermaid.ps1
#
# Gera diagrama Mermaid ER a partir do schema.xlsx
# ============================================================

param(
    [string]$SchemaFile = "..\schema.xlsx",
    [string]$OutputFile = "..\generated\er-diagram.md"
)

Import-Module ImportExcel

Write-Host "Loading schema..."

$relationships = Import-Excel `
    -Path $SchemaFile `
    -WorksheetName "Relationships"

$lines = @()

$lines += "# Entity Relationship Diagram"
$lines += ""
$lines += '```mermaid'
$lines += "erDiagram"
$lines += ""

foreach ($r in $relationships)
{
    $parent = $r.Parent.ToUpper()
    $child  = $r.Child.ToUpper()

    switch ($r.Relationship)
    {
        "1:N"
        {
            $lines += "$parent ||--o{ $child : contains"
        }

        "N:1"
        {
            $lines += "$parent }o--|| $child : references"
        }

        default
        {
            $lines += "$parent ||--|| $child : related"
        }
    }
}

$lines += '```'

$folder = Split-Path $OutputFile

if (!(Test-Path $folder))
{
    New-Item `
        -ItemType Directory `
        -Path $folder `
        -Force | Out-Null
}

$lines | Set-Content `
    -Path $OutputFile `
    -Encoding UTF8

Write-Host ""
Write-Host "Mermaid diagram generated:"
Write-Host $OutputFile