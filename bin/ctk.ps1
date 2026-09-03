param(
    [string]$Command,
    [string]$Argument
)

switch ($Command.ToLower())
{
	"list"
	{
		. "$PSScriptRoot\..\modules\repositories.ps1"

		$Repos = Get-CtkRepositories

		Write-Host ""
		Write-Host "Repos encontrados: $($Repos.Count)"
		Write-Host ""

		Write-Host ("{0,-20} {1,-8} {2}" -f "REPOSITORY","STATUS","PATH")
		Write-Host ("{0,-20} {1,-8} {2}" -f "----------","------","----")

		foreach ($Repo in $Repos)
		{
			Write-Host (
				"{0,-20} {1,-8} {2}" -f `
				$Repo.Name, `
				"OK", `
				$Repo.Path
			)
		}
	}

	"export"
	{
		. "$PSScriptRoot\..\modules\repositories.ps1"
		. "$PSScriptRoot\..\modules\export.ps1"

		if ($Argument -eq "--all")
		{
			Invoke-CtkExportAll
		}
		else
		{
			Invoke-CtkExport $Argument
		}
	}

	"checkpoint"
	{
		. "$PSScriptRoot\..\modules\repositories.ps1"
		. "$PSScriptRoot\..\modules\export.ps1"
		. "$PSScriptRoot\..\modules\checkpoint.ps1"

		Invoke-CtkCheckpoint
	}

	"status"
	{
		. "$PSScriptRoot\..\modules\config.ps1"
		. "$PSScriptRoot\..\modules\repositories.ps1"
		. "$PSScriptRoot\..\modules\status.ps1"

		Invoke-CtkStatus
	}

	"diff"
	{
		. "$PSScriptRoot\..\modules\repositories.ps1"
		. "$PSScriptRoot\..\modules\diff.ps1"

		Invoke-CtkDiff
	}

	"end"
	{
		. "$PSScriptRoot\..\modules\config.ps1"
		. "$PSScriptRoot\..\modules\repositories.ps1"
		. "$PSScriptRoot\..\modules\export.ps1"
		. "$PSScriptRoot\..\modules\checkpoint.ps1"
		. "$PSScriptRoot\..\modules\status.ps1"
		. "$PSScriptRoot\..\modules\end.ps1"

		Invoke-CtkEnd
	}

	"start"
	{
		. "$PSScriptRoot\..\modules\config.ps1"
		. "$PSScriptRoot\..\modules\repositories.ps1"
		. "$PSScriptRoot\..\modules\start.ps1"

		Invoke-CtkStart
	}

	"doctor"
	{
		. "$PSScriptRoot\..\modules\config.ps1"
		. "$PSScriptRoot\..\modules\repositories.ps1"
		. "$PSScriptRoot\..\modules\doctor.ps1"

		Invoke-CtkDoctor
	}

	"summary"
	{
		. "$PSScriptRoot\..\modules\summary.ps1"
		Invoke-CtkSummary
	}

	"report"
	{
		. "$PSScriptRoot\..\modules\config.ps1"
		. "$PSScriptRoot\..\modules\repositories.ps1"
		. "$PSScriptRoot\..\modules\report.ps1"

		Invoke-CtkReport
	}

	"test"
	{
		. "$PSScriptRoot\..\modules\config.ps1"

		$Git = Get-CtkTool "git"

		Write-Host $Git

		& $Git --version
	}

    default
    {
        Write-Host ""
        Write-Host "CTK Commands"
        Write-Host ""
        Write-Host "ctk list"
        Write-Host "ctk export --all"
        Write-Host "ctk export AEGIS"
        Write-Host "ctk checkpoint"
		Write-Host "ctk status"
		Write-Host "ctk diff"
		Write-Host "ctk end"
		Write-Host "ctk start"
		Write-Host "ctk doctor"
		Write-Host "ctk summary"
		Write-Host "ctk report"
    }
}