@echo off
rem This script installs Cygwin from the Windows iso and then
rem runs SSHD set up script 'setup_cygwin-sshd'. Run this inside Windows.
rem The first argument is the path to the Cygwin setup executable.

echo Set variables
rem %~dp0 is the path of this script
set APP_DIR=%~dp0
echo APP_DIR: %APP_DIR%
set CYGWINDIR=%SYSTEMDRIVE%\cygwin
echo CYGWINDIR: %CYGWINDIR%

echo Enable logging
echo Create dir: %CYGWINDIR%
md %CYGWINDIR% > NUL 2>&1
set LOGFILE=%CYGWINDIR%\cygwin-setup.log
echo LOGFILE: %LOGFILE%

call :MAIN > %LOGFILE%
exit /B

rem ### MAIN #################################################################

:MAIN
echo APP_DIR: %APP_DIR%
cd /d "%APP_DIR%"

set "SETUP_EXE=cygwin-setup.exe"
if not exist %SETUP_EXE% (
    echo ERROR: %SETUP_EXE% not found
    exit /B
)

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

echo # Configure Cygwin and enable SSHD
set PATH=%PATH%;%CYGWINDIR%\bin
set LOGFILESSHD=%CYGWINDIR%\setup_cygwin-sshd.log
echo Configure and enable SSHD > %LOGFILESSHD%
sh setup_cygwin-sshd >> %LOGFILESSHD% 2>&1
