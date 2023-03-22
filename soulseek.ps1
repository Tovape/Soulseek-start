$started = $false
$sqt = $null;

Start-Process -Passthru -FilePath 'SoulseekQt.exe'

Do {
    $sqt = Get-Process -name "SoulseekQt" -ErrorAction SilentlyContinue
    Write-Host $sqt
    If (($sqt) -eq ($false)) {
        Write-Host 'Waiting..'
        Start-Sleep -Seconds 1
    } Else {
        $started = $true
        Start-Sleep -Seconds 4
        (New-Object -ComObject WScript.Shell).AppActivate(($sqt).MainWindowTitle)
        $sqt.CloseMainWindow()
    }

} Until ($started)