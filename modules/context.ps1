function Invoke-CtkContext
{
    $Root = Split-Path $PSScriptRoot -Parent

    $OutputFile = Join-Path $Root "CURRENT-CONTEXT.md"

    $Files = @(
        (Join-Path $Root "03-SNAPSHOTS\03-CKS-SNAPSHOT-LATEST.md"),
        (Join-Path $Root "00-INBOX\TASKS.md"),
        (Join-Path $Root "90-FUTURE\90-FUTURE-VISION-AEGIS-PROPERTY.md")
    )

    $Builder = @()

    $Builder += "# CURRENT CONTEXT"
    $Builder += ""
    $Builder += "Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    $Builder += ""

    foreach ($File in $Files)
    {
		foreach ($File in $Files)
		{
			Write-Host "Checking: $File"

			if (Test-Path $File)
			{
				Write-Host "[OK]"
			}
			else
			{
				Write-Host "[NOT FOUND]"
			}
		}
        if (Test-Path $File)
        {
            $Builder += "---"
            $Builder += ""
            $Builder += "# Source: $([System.IO.Path]::GetFileName($File))"
            $Builder += ""

            $Builder += Get-Content $File
            $Builder += ""
        }
    }

    Set-Content `
        -Path $OutputFile `
        -Value $Builder

    Write-Host ""
    Write-Host "[OK] Context generated:"
    Write-Host $OutputFile
}

