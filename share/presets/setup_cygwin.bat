@echo off
rem This script installs Cygwin from the Windows iso and then
rem runs SSHD set up script 'setup_cygwin-sshd'. Run this inside Windows.
rem The first argument is the path to the Cygwin setup executable.

echo Parse arguments
rem Check if command line argument is empty else use default executable
if "%~1"=="" (
    set "SETUP_EXE=cygwin-setup.exe"
) else (
    set "SETUP_EXE=%~1"
)
echo SETUP_EXE: %SETUP_EXE%
rem check if file exists
if not exist %SETUP_EXE% (
    echo ERROR: %SETUP_EXE% not found
    exit /b
)

echo Set variables
rem %~dp0 is the path of this script
set APP_DIR=%~dp0
set CYGWINDIR=%SYSTEMDRIVE%\cygwin
echo CYGWINDIR: %CYGWINDIR%

echo Enable logging
echo Create dir: %CYGWINDIR%
md %CYGWINDIR% > NUL 2>&1
set LOGFILE=%CYGWINDIR%\cygwin-setup.log
echo LOGFILE: %LOGFILE%

call :LOG > %LOGFILE%
exit /B

:LOG
echo cd to: %APP_DIR%
cd /d "%APP_DIR%"
echo Current dir: %CD%

echo # Install Cygwin
%SETUP_EXE% ^
    --root %CYGWINDIR% ^
    --quiet-mode ^
    --local-install ^
    --mirror-mode ^
    --no-startmenu ^
    --no-desktop ^
    --disable-buggy-antivirus ^
    --categories Pending ^
    --packages [PACKAGES]

rem dont use all, will abort
rem on XP works: --categories All

set PATH=%PATH%;%CYGWINDIR%\bin

rem echo # Create bash profile files
rem bash --login -c exit
rem runas /user:Administrator "bash --login -c exit"

echo # Configure Cygwin and enable SSHD
set LOGFILESSHD=%CYGWINDIR%\setup_cygwin-sshd.log
echo Configure and enable SSHD > %LOGFILESSHD%
sh setup_cygwin-sshd >> %LOGFILESSHD% 2>&1
