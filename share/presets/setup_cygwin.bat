@echo off
rem This script installs Cygwin from the Windows iso and then
rem runs SSHD set up script 'setup_cygwin-sshd'. Run this inside Windows XP

echo "Enable logging"
md %SYSTEMDRIVE%\cygwin > NUL 2>&1
set "LOGFILE=%SYSTEMDRIVE%\cygwin\cygwin-setup.log"
call :LOG > %LOGFILE%
exit /B

:LOG
echo "Current dir: %CD%"
set "CYGDIR=%SOURCE%cygwin"
echo "CYGDIR: %CYGDIR%"
cd /d "%CYGDIR%"
echo "Current dir: %CD%"

echo "# Install Cygwin"
cygwin-setup.exe ^
    --quiet-mode ^
    --local-install ^
    --mirror-mode ^
    --no-startmenu ^
    --no-desktop ^
    --disable-buggy-antivirus ^
    --categories All

set PATH=%PATH%;%SYSTEMDRIVE%\cygwin\bin

echo "# Create bash profile files"
bash --login -c exit

echo "# Configure Cygwin and enable SSHD"
set "LOGFILESSHD=%SYSTEMDRIVE%\cygwin\setup_cygwin-sshd.log"
sh setup_cygwin-sshd > %LOGFILESSHD% 2>&1
