@echo off

set TARGET='C:\Program Files\Emacs\bin\runemacs.exe'
set SHORTCUT='C:\Users\grant\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\runemacs.exe.lnk'
set ICON='C:\Program Files\Emacs\bin\runemacs.exe'
set ARGS='--daemon'
set WD='.'
set PWS=powershell.exe -ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile

%PWS% -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut(%SHORTCUT%); $S.TargetPath = %TARGET%; $S.IconLocation = %ICON%; $S.Arguments = %ARGS%; $S.WorkingDirectory = %WD%; $S.Save()"

copy "C:\Users\grant\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\runemacs.exe.lnk" "C:\Users\grant\Bin\startEmacsServer.lnk"

set TARGET='C:\Program Files\Emacs\bin\emacsclientw.exe'
set SHORTCUT='C:\Users\grant\Bin\emacs.lnk'
set ICON='C:\Program Files\Emacs\bin\runemacs.exe'
set ARGS='-na """"""'
set WD='.'
set PWS=powershell.exe -ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile

%PWS% -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut(%SHORTCUT%); $S.TargetPath = %TARGET%; $S.IconLocation = %ICON%; $S.Arguments = %ARGS%; $S.WorkingDirectory = %WD%; $S.Save()"

set TARGET='C:\Program Files\Emacs\bin\emacsclientw.exe'
set SHORTCUT='C:\Bin\emacs.lnk'
set ICON='C:\Program Files\Emacs\bin\runemacs.exe'
set ARGS='-na """"""'
set WD='.'
set PWS=powershell.exe -ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile

%PWS% -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut(%SHORTCUT%); $S.TargetPath = %TARGET%; $S.IconLocation = %ICON%; $S.Arguments = %ARGS%; $S.WorkingDirectory = %WD%; $S.Save()"

set TARGET='C:\Program Files\Emacs\bin\emacsclientw.exe'
set SHORTCUT='C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Emacs.lnk'
set ICON='C:\Program Files\Emacs\bin\runemacs.exe'
set ARGS='-na """""" -c'
set WD='.'
set HOT='CTRL+SHIFT+E'
set PWS=powershell.exe -ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile

%PWS% -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut(%SHORTCUT%); $S.TargetPath = %TARGET%; $S.IconLocation = %ICON%; $S.Arguments = %ARGS%; $S.WorkingDirectory = %WD%; $S.Hotkey = %HOT%; $S.Save()"
