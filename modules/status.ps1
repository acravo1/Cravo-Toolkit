function Invoke-CtkStatus
{
    $State = Get-CtkMachineState

    Write-Host ""
    Write-Host "CTK STATUS"
    Write-Host "=========="
    Write-Host ""

    Write-Host ("Machine State : {0}" -f $State.MachineState)

    Write-Host ""

    Write-Host "Context"
    Write-Host "-------"

    Write-Host (
        "CURRENT-CONTEXT : " +
        $(if ($State.HasContext) { "OK" } else { "MISSING" })
    )

    Write-Host (
        "SESSION-OUTPUT  : " +
        $(if ($State.HasSession) { "PRESENT" } else { "NOT FOUND" })
    )

    Write-Host (
        "03-SESSIONS     : " +
        $(if ($State.HasArchive) { "OK" } else { "MISSING" })
    )

    Write-Host ""

    Write-Host "Git"
    Write-Host "---"

    Write-Host (
        "Dirty Changes   : " +
        $(if ($State.GitDirty) { "YES" } else { "NO" })
    )

    Write-Host (
        "Push Required   : " +
        $(if ($State.PushRequired) { "YES" } else { "NO" })
    )

    Write-Host ""

    Write-Host "Next Commands"
    Write-Host "-------------"
    Write-Host ""
    Write-Host ("  " + $State.NextCommand)
    Write-Host ""
}