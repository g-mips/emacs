@echo off

push "C:\Users\grant\Documents\emacs\"

git remote update

for /f %%i in ('git rev-parse @{u}') do set UPSTREAM=%%i
for /f %%i in ('git rev-parse @') do set LOCAL=%%i
for /f %%i in ('git rev-parse %UPSTREAM%') do set REMOTE=%%i
for /f %%i in ('git merge-base @ %UPSTREAM%') do set BASE=%%i

if %LOCAL%==%REMOTE% (
    echo "Up-to-date"
    goto EOF
    )
if %LOCAL%==%BASE% (
    echo "Pulling..."
    git pull
    goto EOF
    )
if %REMOTE%==%BASE% (
    echo "Need to push"
    goto EOF
    )

echo "Diverged"

:EOF
pop
