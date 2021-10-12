Invoke-WebRequest -Uri https://jrsoftware.org/download.php/is.exe -OutFile inno.exe

Start-Process -FilePath inno.exe -ArgumentList "/VERYSILENT","/NORESTART"

Start-Process -FilePath "C:/Program Files (x86)/Inno Setup 6/ISCC.exe" -ArgumentList "helm_installer.iss"