$started = $false;
$sqt = $null;
$ip = Get-NetIPAddress -AddressFamily IPv4;
$flag = $false;

for($i=0; $i -lt $ip.Length; $i++) {
    $ip[$i] = $ip[$i].toString();
    $ip[$i] = $ip[$i].Substring(0,3)

    if (($ip[$i]) -eq ("192")) {
        $flag = $true;
    }
}

if ($flag -eq $false) {
    exit
}


Start-Process -Passthru -FilePath 'SoulseekQt.exe'

Do {
    $sqt = Get-Process -name "SoulseekQt" -ErrorAction SilentlyContinue
    Write-Host $sqt
    If (($sqt) -eq ($false)) {
        Write-Host 'Waiting..'
        Start-Sleep -Seconds 1
    } Else {
        $started = $true
        Start-Sleep -Seconds 10
        (New-Object -ComObject WScript.Shell).AppActivate(($sqt).MainWindowTitle)
	Start-Sleep -Seconds 2
        $sqt.CloseMainWindow()
    }

} Until ($started)