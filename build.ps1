Invoke-WebRequest -Uri https://jrsoftware.org/download.php/is.exe -OutFile inno.exe

inno.exe /VERYSILENT /NORESTART /ALLUSERS

"C:/Program Files (x86)/Inno Setup 6/ISCC.exe" "helm_installer.iss"