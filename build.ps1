Invoke-WebRequest -Uri https://jrsoftware.org/download.php/is.exe -OutFile inno.exe

$process = Start-Process -FilePath .\inno.exe -ArgumentList "/VERYSILENT", "/NORESTART" -NoNewWindow -PassThru -Wait

$process.WaitForExit()

Write-Host "Inno installer exit code : " $process.ExitCode

$appver = "1.0." + ${Env:CIRCLE_BUILD_NUM}

Write-Host "App Version : " $appver

$process = Start-Process -FilePath ${Env:ProgramFiles(x86)}"\Inno Setup 6\ISCC.exe" -ArgumentList "helm_installer.iss", "/DVersion=$appver" -NoNewWindow -PassThru -Wait

$process.WaitForExit()

Write-Host "Inno Compiler exit code : " $process.ExitCode