function Get-CtkMachineState
{
    $Root = Split-Path $PSScriptRoot -Parent

    $ContextFile = Join-Path `
        $Root `
        "00-WIP\CURRENT-CONTEXT.md"

    $SessionFile = Join-Path `
        $Root `
        "00-WIP\SESSION-OUTPUT.md"

    $SessionsFolder = Join-Path `
        $Root `
        "03-SESSIONS"

    $HasContext =
        Test-Path $ContextFile

    $HasSession =
        Test-Path $SessionFile

    $HasArchive =
        Test-Path $SessionsFolder

    $Git = Get-CtkTool "git"

    Push-Location $Root

    try
    {
        $GitDirty = $false
        $PushRequired = $false

        if (Test-Path $Git)
        {
            $GitDirty =
                (& $Git status --porcelain 2>$null).Count -gt 0

            $AheadCount = 0

            try
            {
                $AheadCount =
                    & $Git rev-list `
                        --count `
                        "@{u}..HEAD" `
                        2>$null

                if (-not $AheadCount)
                {
                    $AheadCount = 0
                }
            }
            catch
            {
                $AheadCount = 0
            }

            $PushRequired =
                [int]$AheadCount -gt 0
        }
    }
    finally
    {
        Pop-Location
    }

    if (-not $HasArchive)
    {
        $MachineState = "BROKEN"
    }
    elseif ($HasContext -and $HasSession)
    {
        $MachineState = "ACTIVE"
    }
    elseif ($PushRequired)
    {
        $MachineState = "PENDING_PUSH"
    }
    elseif ($GitDirty)
    {
        $MachineState = "DIRTY"
    }
    else
    {
        $MachineState = "READY"
    }

    switch ($MachineState)
    {
        "ACTIVE"
        {
            $NextCommand = "ctk end"
        }

        "READY"
        {
            $NextCommand = "ctk start"
        }

        "DIRTY"
        {
            $NextCommand = "ctk end"
        }

        "PENDING_PUSH"
        {
            $NextCommand = "ctk end"
        }

        "BROKEN"
        {
            $NextCommand = "manual repair required"
        }
    }

    [PSCustomObject]@{
        MachineState = $MachineState
        HasContext   = $HasContext
        HasSession   = $HasSession
        HasArchive   = $HasArchive
        GitDirty     = $GitDirty
        PushRequired = $PushRequired
        NextCommand  = $NextCommand
    }
}