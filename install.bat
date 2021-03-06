@echo off & setlocal

REM Display welcome message and info
echo\
echo Welcome to automatic Atom.io installer with packages by Andre Sieverding
echo\

REM Get absolute directory path of current file and remove last character (backslash)
SET dir=%~dp0
SET dir=%dir:~0,-1%

REM Get home dir path
SET home=%systemdrive%%homepath%

REM Change into ~/.atom directory
cd %home%\.atom

REM Install apm packages
echo Installing Atom.io packages...
echo\
call apm install --packages-file %dir%\atom\package-list.txt
echo\

REM Change into atom-io-customization/atom directory
cd %dir%\atom

REM Copy all configurations into current directory
echo Copying files...
echo\

for %%f in (*.cson *.coffee *.txt *.json *.less .htmlhintrc .jshintrc .sass-lint.yml .gitignore) do (
	echo Copying: %%f -^> %home%\.atom\%%f
	copy %%f %home%\.atom\%%f > nul
)

echo\
echo Done! :)
echo\
echo Enjoy your customized Atom.io Code-Editor!
echo\

pause
endlocal
