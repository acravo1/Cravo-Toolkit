# ============================================================
# generate-datamodel.ps1
#
# Gera documentação Markdown do modelo de dados
# a partir do schema.xlsx
# ============================================================

param(
    [string]$SchemaFile = "..\schema.xlsx",
    [string]$OutputFile = "..\generated\data-model.md"
)

Import-Module ImportExcel

Write-Host "Loading schema..."

$entities = Import-Excel `
    -Path $SchemaFile `
    -WorksheetName "Entities"

$fields = Import-Excel `
    -Path $SchemaFile `
    -WorksheetName "Fields"

$relationships = Import-Excel `
    -Path $SchemaFile `
    -WorksheetName "Relationships"

$lines = @()

$lines += "# Data Model"
$lines += ""
$lines += "Generated from schema.xlsx"
$lines += ""
$lines += "---"
$lines += ""

foreach ($entity in $entities)
{
    if ($entity.Persistent -ne "TRUE")
    {
        continue
    }

    $entityName = $entity.Entity

    $lines += "## $entityName"
    $lines += ""

    if ($entity.Description)
    {
        $lines += $entity.Description
        $lines += ""
    }

    $entityFields = $fields |
        Where-Object { $_.Entity -eq $entityName } |
        Sort-Object FieldOrder

    $lines += "### Fields"
    $lines += ""

    $lines += "| Order | Field | Type | PK | FK | Required | Lookup | Description |"
    $lines += "|---------|---------|---------|---------|---------|---------|---------|---------|"

    foreach ($field in $entityFields)
    {
        $lines += "| $($field.FieldOrder) | $($field.Field) | $($field.Type) | $($field.PK) | $($field.FK) | $($field.Required) | $($field.Lookup) | $($field.Description) |"
    }

    $lines += ""

    $entityRelations = $relationships |
        Where-Object {
            $_.Parent -eq $entityName -or
            $_.Child -eq $entityName
        }

    if ($entityRelations.Count -gt 0)
    {
        $lines += "### Relationships"
        $lines += ""

        foreach ($relation in $entityRelations)
        {
            $lines += "- $($relation.Parent) $($relation.Relationship) $($relation.Child)"
        }

        $lines += ""
    }

    $lines += "---"
    $lines += ""
}

$folder = Split-Path $OutputFile

if (!(Test-Path $folder))
{
    New-Item `
        -Path $folder `
        -ItemType Directory `
        -Force | Out-Null
}

$lines | Set-Content `
    -Path $OutputFile `
    -Encoding UTF8

Write-Host ""
Write-Host "Data model generated:"
Write-Host $OutputFile