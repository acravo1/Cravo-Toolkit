
# Repository Export Tool
# Cravo-Toolkit

$RepoRoot = (Get-Location).Path
$RepoName = Split-Path $RepoRoot -Leaf

$ExportDir = Join-Path $RepoRoot "exports"

if (!(Test-Path $ExportDir))
{
    New-Item -ItemType Directory -Path $ExportDir | Out-Null
}

$OutputFile = Join-Path $ExportDir "${RepoName}_export.txt"

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

foreach ($Pattern in $Extensions)
{
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

        $RelativePath = $File.FullName.Replace($RepoRoot, "").TrimStart("\")

        $Content += ""
        $Content += "=" * 80
        $Content += "FILE: $RelativePath"
        $Content += "=" * 80
        $Content += ""

        try
        {
            $Content += Get-Content $File.FullName -Encoding UTF8
        }
        catch
        {
            $Content += "[ERROR READING FILE]"
        }

        $Content += ""
    }
}

$Content | Out-File `
    -FilePath $OutputFile `
    -Encoding utf8

Write-Host ""
Write-Host "Export completed:"
Write-Host $OutputFile
Write-Host ""