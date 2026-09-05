# ============================================================
# generate-workspace.ps1
#
# Gera workspace.xlsx a partir do schema.xlsx
# ============================================================

param(
    [string]$SchemaFile   = "..\schema.xlsx",
    [string]$WorkspaceFile = "..\generated\workspace.xlsx"
)

Import-Module ImportExcel

function Log-Info
{
    param([string]$Message)

    $Timestamp = Get-Date -Format "HH:mm:ss"

    Write-Host "[$Timestamp] $Message"
}

function Log-Step
{
    param([string]$Message)

    Write-Host "`t$Message"
}

Log-Info "START"

# ============================================================
# Load schema
# ============================================================

Log-Info "Loading schema..."

$entities = Import-Excel `
    -Path $SchemaFile `
    -WorksheetName "Entities"

Log-Step "Entities loaded: $($entities.Count)"

$fields = Import-Excel `
    -Path $SchemaFile `
    -WorksheetName "Fields"

Log-Step "Fields loaded: $($fields.Count)"

$lookups = Import-Excel `
    -Path $SchemaFile `
    -WorksheetName "Lookups"

Log-Step "Lookups loaded: $($lookups.Count)"

$metadata = Import-Excel `
    -Path $SchemaFile `
    -WorksheetName "Metadata"

Log-Step "Metadata loaded: $($metadata.Count)"

# ============================================================
# Delete previous workspace
# ============================================================

if (Test-Path $WorkspaceFile)
{
    Log-Info "Removing existing workspace..."
    Remove-Item $WorkspaceFile -Force
    Log-Step "Previous workspace removed"
}

# ============================================================
# Metadata
# ============================================================

Log-Info "Creating Metadata worksheet..."

$metadata |
    Export-Excel `
        -Path $WorkspaceFile `
        -WorksheetName "Metadata" `
        -TableName "Metadata" `
        -AutoSize

Log-Step "Metadata worksheet complete"

# ============================================================
# Entities
# ============================================================

Log-Info "Generating persistent entities..."

foreach ($entity in $entities)
{
    if ($entity.Persistent -ne "TRUE")
    {
        continue
    }

    $entityName = $entity.Entity

    Log-Info "Creating worksheet: $entityName"

    $entityFields = $fields |
        Where-Object {
            $_.Entity -eq $entityName
        } |
        Sort-Object FieldOrder

    Log-Step "Fields found: $($entityFields.Count)"

    $templateRow = [ordered]@{}

    foreach ($field in $entityFields)
    {
        Log-Step "Adding field: $($field.Field)"

        $templateRow[$field.Field] = ""
    }

    @([pscustomobject]$templateRow) |
        Export-Excel `
            -Path $WorkspaceFile `
            -WorksheetName $entityName `
            -AutoSize `
            -FreezeTopRow `
            -Append `
            -TableName $entityName

    Log-Step "Worksheet completed"
}

# ============================================================
# Lookups
# ============================================================

Log-Info "Generating lookup worksheets..."

$lookupNames = $lookups |
    Where-Object {
        $_.Lookup -and
        $_.Lookup.Trim() -ne ""
    } |
    Select-Object -ExpandProperty Lookup -Unique

Log-Step "Lookup count: $($lookupNames.Count)"

foreach ($lookupName in $lookupNames)
{
    Log-Step "Lookup discovered: [$lookupName]"
}

foreach ($lookupName in $lookupNames)
{
    Log-Info "Creating lookup worksheet: $lookupName"

    $lookupData = $lookups |
        Where-Object {
            $_.Lookup -eq $lookupName
        }

    Log-Step "Rows: $($lookupData.Count)"

    $lookupData |
        Export-Excel `
            -Path $WorkspaceFile `
            -WorksheetName $lookupName `
            -AutoSize `
            -Append `
            -TableName $lookupName

    Log-Step "Lookup completed"
}

# ============================================================
# Validation
# ============================================================

Log-Info "Validation..."

if (Test-Path $WorkspaceFile)
{
    $file = Get-Item $WorkspaceFile

    $SizeKB = :Round($file.Length / 1KB, 2)

    Log-Step "File exists"
    Log-Step "Size: $SizeKB KB"
    Log-Step "Last Write: $($file.LastWriteTime)"
}
else
{
    Log-Step "Workspace file not found"
}

Log-Info "END"
Log-Info "Workspace generated:"
Log-Step $WorkspaceFile