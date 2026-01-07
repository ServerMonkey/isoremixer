; NSIS script

Name "Cygwin Autoinstaller"

OutFile "cygwin-autoinstall.exe"

; Request application privileges for Windows Vista
RequestExecutionLevel user

; Build Unicode installer
Unicode True

; The default installation directory
InstallDir "$TEMP\cygwin-autoinstall-temp"

; No UI pages needed
SilentInstall silent

;--------------------------------

; Pages
Page directory
Page instfiles

;--------------------------------

Section ""

    ; Ensure temp directory exists
    CreateDirectory "$INSTDIR"

    ; Extract everything into temp
    SetOutPath "$INSTDIR"
    File /r "cygwin\*.*"

    ; Install and wait until it finishes
    ExecWait '"$INSTDIR\setup_cygwin.bat"'

    ; Clean up
    RMDir /r "$INSTDIR"
  
SectionEnd
