# Repository Export Tool
# Cravo-Toolkit

function Write-ExportLog
{
    param(
        [string]$Message
    )

    Write-Host (
        "[{0}] {1}" -f `
        (Get-Date -Format "HH:mm:ss"), `
        $Message
    )
}

$ExportStart = Get-Date

$RepoRoot = (Get-Location).Path
$RepoName = Split-Path $RepoRoot -Leaf

Write-ExportLog ("Repository: {0}" -f $RepoName)
Write-ExportLog ("Root: {0}" -f $RepoRoot)

$ExportDir = Join-Path $RepoRoot "exports"

if (!(Test-Path $ExportDir))
{
    Write-ExportLog "Creating exports directory"

    New-Item `
        -ItemType Directory `
        -Path $ExportDir | Out-Null
}

$OutputFile = Join-Path `
    $ExportDir `
    "${RepoName}_export.txt"

$Extensions = @(
    "*.md",
    "*.txt",
    "*.yml",
    "*.yaml",
    "*.json",
    "*.ps1"
)

$Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

$Content = @()

$Content += "=" * 80
$Content += "Repository Export"
$Content += "=" * 80
$Content += ""
$Content += "Repository : $RepoName"
$Content += "Date       : $Timestamp"
$Content += "Root       : $RepoRoot"
$Content += ""

$TotalFiles = 0
$FilesExported = 0

Write-ExportLog "Scanning repository"

foreach ($Pattern in $Extensions)
{
    Write-ExportLog ("Searching pattern: {0}" -f $Pattern)

    $Files = Get-ChildItem `
        -Path $RepoRoot `
        -Recurse `
        -File `
        -Filter $Pattern `
        -ErrorAction SilentlyContinue

    Write-ExportLog (
        "Found {0} files for {1}" -f `
        $Files.Count, `
        $Pattern
    )

    $TotalFiles += $Files.Count
}

Write-ExportLog (
    "Total candidate files: {0}" -f `
    $TotalFiles
)

foreach ($Pattern in $Extensions)
{
    Write-ExportLog (
        "Processing pattern: {0}" -f `
        $Pattern
    )

    $Files = Get-ChildItem `
        -Path $RepoRoot `
        -Recurse `
        -File `
        -Filter $Pattern `
        -ErrorAction SilentlyContinue

    foreach ($File in $Files)
    {
        if ($File.FullName -like "*\exports\*")
        {
            continue
        }

        $FilesExported++

        Write-ExportLog (
            "File {0}/{1}: {2}" -f `
            $FilesExported, `
            $TotalFiles, `
            $File.Name
        )

        $RelativePath = $File.FullName.
            Replace($RepoRoot, "").
            TrimStart("\")

        $Content += ""
        $Content += "=" * 80
        $Content += "FILE: $RelativePath"
        $Content += "=" * 80
        $Content += ""

        try
        {
            $Content += Get-Content `
                $File.FullName `
                -Encoding UTF8
        }
        catch
        {
            $Content += "[ERROR READING FILE]"
        }

        $Content += ""
    }
}

Write-ExportLog "Writing export file"

$Content | Out-File `
    -FilePath $OutputFile `
    -Encoding utf8

$Duration = (Get-Date) - $ExportStart

Write-Host ""

Write-ExportLog "Export completed"
Write-ExportLog ("Output: {0}" -f $OutputFile)
Write-ExportLog ("Files exported: {0}" -f $FilesExported)
Write-ExportLog (
    "Duration: {0}" -f `
    $Duration.ToString("hh\:mm\:ss")
)

Write-Host ""