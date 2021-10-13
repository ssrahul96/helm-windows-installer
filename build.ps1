Invoke-WebRequest -Uri https://jrsoftware.org/download.php/is.exe -OutFile inno.exe

$process = Start-Process -FilePath .\inno.exe -ArgumentList "/VERYSILENT","/NORESTART" -NoNewWindow -PassThru -Wait

$process.WaitForExit()

Write-Host "Process exit code : " $process.ExitCode

#for debugging
Get-ChildItem -Path ${Env:ProgramFiles(x86)}"\Inno Setup 6\"

#for debugging
Get-ChildItem -Path ${Env:ProgramFiles}"\Inno Setup 6\"

Start-Process -FilePath ${Env:ProgramFiles(x86)}"\Inno Setup 6\ISCC.exe" -ArgumentList "helm_installer.iss"