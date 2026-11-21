param(
    [int]$MaxFileSizeKB = 512,
    [int]$MaxContentFileMB = 4
)

$ErrorActionPreference = "Stop"

$RepositoryRoot = (Get-Location).ProviderPath
$RepositoryName = Split-Path $RepositoryRoot -Leaf

$OutputFolder = Join-Path $RepositoryRoot "exports"

New-Item `
    -ItemType Directory `
    -Force `
    -Path $OutputFolder | Out-Null

Get-ChildItem `
    -Path $OutputFolder `
    -Force `
    -ErrorAction SilentlyContinue |
Remove-Item `
    -Force `
    -Recurse `
    -ErrorAction SilentlyContinue

$ContextFile = Join-Path $OutputFolder "${RepositoryName}-context.txt"
$TreeFile    = Join-Path $OutputFolder "${RepositoryName}-tree.txt"
$GitFile     = Join-Path $OutputFolder "${RepositoryName}-git.txt"
$ManifestFile = Join-Path $OutputFolder "${RepositoryName}-manifest.txt"
$SnapshotFile = Join-Path $OutputFolder "${RepositoryName}-snapshot.txt"

$IgnoredFolders = @(
    ".git",
    ".github",
    ".vs",
    "bin",
    "obj",
    "node_modules",
    ".venv",
    "venv",
    "__pycache__",
    ".idea",
    "dist",
    "build",
    "exports"
)

$TextExtensions = @(
    ".md",
    ".txt",
    ".yaml",
    ".yml",
    ".json",
    ".ps1",
    ".psm1",
    ".sh",
    ".py",
    ".js",
    ".ts",
    ".html",
    ".css",
    ".sql",
    ".cfg",
    ".ini",
    ".conf",
    ".xml",
    ".csv"
)

$FilesExported = 0
$FilesSkipped  = 0

$Utf8Bom = New-Object System.Text.UTF8Encoding($true)

$MaxContentFileBytes =
    $MaxContentFileMB * 1MB

function New-ContentFile
{
    param(
        [int]$Index
    )

    return (
        Join-Path `
            $OutputFolder `
            ("{0}-content-{1:d2}.txt" -f `
                $RepositoryName,
                $Index)
    )
}

$ContentHeader = @"
REPOSITORY CONTENT

Repository : $RepositoryName
Date       : $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
Root       : $RepositoryRoot

"@

$script:ContentHeader = $ContentHeader

function Switch-ContentFile
{
    $script:ContentWriter.Flush()
    $script:ContentWriter.Dispose()

    $script:ContentIndex++

    $script:ContentFile =
        New-ContentFile `
            -Index $script:ContentIndex

    [System.IO.File]::WriteAllText(
        $script:ContentFile,
        $script:ContentHeader,
        $Utf8Bom
    )

    $script:ContentWriter =
        [System.IO.StreamWriter]::new(
            $script:ContentFile,
            $true,
            $Utf8Bom
        )
}

$ContentIndex = 1

$ContentFile =
    New-ContentFile `
        -Index $ContentIndex

# -------------------------------------------------------------------
# GIT
# -------------------------------------------------------------------

try
{
    $GitBranch = (
        git branch --show-current 2>$null
    ).Trim()

    $GitStatus =
        git status 2>$null |
        Out-String

    $GitLog =
        git log --oneline -20 2>$null |
        Out-String

    if([string]::IsNullOrWhiteSpace($GitBranch))
    {
        $GitBranch = "Unknown"
    }
}
catch
{
    $GitBranch = "N/A"
    $GitStatus = "Git repository not detected."
    $GitLog    = ""
}

$GitContent = @"
REPOSITORY GIT INFORMATION

Repository : $RepositoryName
Date       : $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
Branch     : $GitBranch

GIT STATUS

$GitStatus

LAST 20 COMMITS

$GitLog
"@

[System.IO.File]::WriteAllText(
    $GitFile,
    $GitContent,
    $Utf8Bom
)

# -------------------------------------------------------------------
# MANIFEST
# -------------------------------------------------------------------

$ManifestContent = @()

Get-ChildItem `
    -Path $RepositoryRoot `
    -Recurse `
    -File |
Where-Object {

    $_.FullName -notlike "*\exports\*"

} |
Sort-Object FullName |
ForEach-Object {

    $RelativePath =
        $_.FullName.Substring(
            $RepositoryRoot.Length
        ).TrimStart("\")

    $ManifestContent += (
        "{0,-80} {1,10:N0} bytes" -f
        $RelativePath,
        $_.Length
    )
}

[System.IO.File]::WriteAllText(
    $ManifestFile,
    (
        $ManifestContent -join
        [Environment]::NewLine
    ),
    $Utf8Bom
)

# -------------------------------------------------------------------
# CONTEXT
# -------------------------------------------------------------------

$ContextContent = @"
REPOSITORY CONTEXT

Repository : $RepositoryName
Date       : $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
Root       : $RepositoryRoot

FILES

Git      : $(Split-Path $GitFile -Leaf)
Tree     : $(Split-Path $TreeFile -Leaf)
Manifest : $(Split-Path $ManifestFile -Leaf)
Snapshot : $(Split-Path $SnapshotFile -Leaf)
Content  : ${RepositoryName}-content-*.txt

PURPOSE

context.txt :
Project summary and metadata.

git.txt :
Branch, status and recent commits.

tree.txt :
Repository structure.

manifest.txt :
Inventory of all repository files.

snapshot.txt :
High-level repository summary.

content.txt :
Text content of exported files.

"@

[System.IO.File]::WriteAllText(
    $ContextFile,
    $ContextContent,
    $Utf8Bom
)

# -------------------------------------------------------------------
# CONTENT HEADER
# -------------------------------------------------------------------

[System.IO.File]::WriteAllText(
    $ContentFile,
    $ContentHeader,
    $Utf8Bom
)

$ContentWriter =
    [System.IO.StreamWriter]::new(
        $ContentFile,
        $true,
        $Utf8Bom
    )
	
# -------------------------------------------------------------------
# CONTENT EXPORT
# -------------------------------------------------------------------

Get-ChildItem `
    -Path $RepositoryRoot `
    -Recurse `
    -File |
ForEach-Object {

    $CurrentFile = $_
    $Skip = $false

    foreach($Folder in $IgnoredFolders)
    {
        if($CurrentFile.FullName -like "*\$Folder\*")
        {
            $Skip = $true
            break
        }
    }

    if($Skip)
    {
        $FilesSkipped++
        return
    }

    if($CurrentFile.Length -gt ($MaxFileSizeKB * 1KB))
    {
        $FilesSkipped++
        return
    }

    $Include = $false

    if(
        $TextExtensions -contains
        $CurrentFile.Extension.ToLower()
    )
    {
        $Include = $true
    }

    if(
        $CurrentFile.Name -in @(
            "Dockerfile",
            "README",
            "README.md",
            "LICENSE",
            ".gitignore",
            ".gitattributes"
        )
    )
    {
        $Include = $true
    }

    if(-not $Include)
    {
        $FilesSkipped++
        return
    }

    try
    {
        $Content =
            Get-Content `
                -Path $CurrentFile.FullName `
                -Raw

		if([string]::IsNullOrWhiteSpace($Content))
		{
			$FilesSkipped++
			return
		}

        $RelativePath =
            $CurrentFile.FullName.Substring(
                $RepositoryRoot.Length
            ).TrimStart("\")

		if(
			(Get-Item $script:ContentFile).Length -ge
			$MaxContentFileBytes
		)
		{
			Switch-ContentFile
		}

		$ContentWriter.WriteLine("")
		$ContentWriter.WriteLine("----------------------------------------------------------------")
		$ContentWriter.WriteLine("FILE: $RelativePath")
		$ContentWriter.WriteLine("----------------------------------------------------------------")
		$ContentWriter.WriteLine("")
		$ContentWriter.WriteLine($Content)
		$ContentWriter.WriteLine("")

        $FilesExported++
    }
    catch
    {
        $FilesSkipped++
    }
}

# -------------------------------------------------------------------
# FOOTER
# -------------------------------------------------------------------

$ContentWriter.WriteLine("")
$ContentWriter.WriteLine("EXPORT SUMMARY")
$ContentWriter.WriteLine("")
$ContentWriter.WriteLine("Files Exported : $FilesExported")
$ContentWriter.WriteLine("Files Skipped  : $FilesSkipped")
$ContentWriter.WriteLine("")

$ContentWriter.Flush()
$ContentWriter.Dispose()

# -------------------------------------------------------------------
# SNAPSHOT
# -------------------------------------------------------------------

$GeneratedFiles = Get-ChildItem `
    -Path $OutputFolder `
    -File |
Sort-Object Name |
Select-Object -ExpandProperty Name

$GeneratedFilesText = $GeneratedFiles -join [Environment]::NewLine

$SnapshotContent = @"
PROJECT SNAPSHOT

Repository : $RepositoryName
Date       : $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
Branch     : $GitBranch

Files Exported : $FilesExported
Files Skipped  : $FilesSkipped

Generated Files

$GeneratedFilesText

"@

[System.IO.File]::WriteAllText(
    $SnapshotFile,
    $SnapshotContent,
    $Utf8Bom
)

# -------------------------------------------------------------------
# TREE
# -------------------------------------------------------------------

$TreeOutput = cmd /c tree /F /A

[System.IO.File]::WriteAllText(
    $TreeFile,
    ($TreeOutput | Out-String),
    $Utf8Bom
)

# -------------------------------------------------------------------
# OUTPUT
# -------------------------------------------------------------------

Write-Host ""
Write-Host "Repository exported successfully"
Write-Host ""

Write-Host "Files exported : $FilesExported"
Write-Host "Files skipped  : $FilesSkipped"

Write-Host ""
Write-Host "Generated:"

Write-Host "  $ContextFile"
Write-Host "  $GitFile"
Write-Host "  $TreeFile"
Write-Host "  $ManifestFile"
Write-Host "  $SnapshotFile"
Write-Host "  $ContentFile"
Write-Host ""

Write-Host (
    "Context : {0:N2} KB" -f (
        (Get-Item $ContextFile).Length / 1KB
    )
)

Write-Host (
    "Git     : {0:N2} KB" -f (
        (Get-Item $GitFile).Length / 1KB
    )
)

Write-Host (
    "Tree    : {0:N2} KB" -f (
        (Get-Item $TreeFile).Length / 1KB
    )
)

Write-Host (
    "Manifest: {0:N2} KB" -f (
        (Get-Item $ManifestFile).Length / 1KB
    )
)

Write-Host (
    "Snapshot: {0:N2} KB" -f (
        (Get-Item $SnapshotFile).Length / 1KB
    )
)

Write-Host (
    "Content : {0:N2} KB" -f (
        (Get-Item $ContentFile).Length / 1KB
    )
)

Write-Host ""