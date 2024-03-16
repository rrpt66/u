@echo off
:getadmin
@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------   
cls
:Keyboard
title Keybord
goto kb
:kb
chcp 65001
echo                                ███████╗███████╗██████╗░███████╗░█████╗░██╗░░██╗
echo                                ╚════██║██╔════╝██╔══██╗╚════██║██╔══██╗╚██╗██╔╝
echo                                ░░███╔═╝█████╗░░██████╔╝░░███╔═╝███████║░╚███╔╝░
echo                                ██╔══╝░░██╔══╝░░██╔══██╗██╔══╝░░██╔══██║░██╔██╗░
echo                                ███████╗███████╗██║░░██║███████╗██║░░██║██╔╝╚██╗
echo                                ╚══════╝╚══════╝╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝░░
pause
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mouclass\Parameters /f >> APB_Log.txt
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "AutoRepeatDelay" /t reg_SZ /d "200" /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "AutoRepeatRate" /t reg_SZ /d "6" /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "BounceTime" /t reg_SZ /d "0" /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "DelayBeforeAcceptance" /t reg_SZ /d "0" /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t reg_SZ /d "59" /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Last BounceKey Setting" /t reg_DWORD /d "0" /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Last Valid Delay" /t reg_DWORD /d "0" /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Last Valid Repeat" /t reg_DWORD /d "0" /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Last Valid Wait" /t reg_DWORD /d "1000" /f
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t reg_SZ /d "506" /f
reg add "HKCU\Control Panel\Accessibility\ToggleKeys" /v "Flags" /t reg_SZ /d "58" /f
reg add "HKCU\Control Panel\Accessibility\MouseKeys" /v "Flags" /t reg_SZ /d "38" /f
reg add "HKCU\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t reg_SZ /d "0" /f
reg add "HKCU\Control Panel\Keyboard" /v "KeyboardDelay" /t reg_SZ /d "0" /f
reg add "HKCU\Control Panel\Keyboard" /v "KeyboardSpeed" /t reg_SZ /d "31" /f
:menu
exit