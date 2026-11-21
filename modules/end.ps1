function Invoke-CtkEnd
{
    $State = Get-CtkMachineState

    if (-not $State.HasSession)
    {
        Write-Host ""
        Write-Host "[ERROR] No active session found"
        return
    }

    Write-Host ""
    Write-Host "Closing session..."
    Write-Host ""

    Invoke-CtkIngest

    Invoke-CtkGitCommit

    Invoke-CtkGitPush

    Write-Host ""
    Write-Host "[OK] Session closed"
    Write-Host ""

    Invoke-CtkStatus
}