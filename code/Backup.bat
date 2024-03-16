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
:backup
cd C:\Users\%username%
mkdir BACKUP
echo backup Successful > BACKUP\backup.txt
cd BACKUP
ping -n 2 127.0.0.1>nul
echo reg Restore Point 
ping -n 2 127.0.0.1>nul
cls
echo backup.
ping -n 2 127.0.0.1>nul
reg export HKLM HKEY_LOCAL_MACHINE.reg >> APB_Log.txt
cls
echo backup..
ping -n 2 127.0.0.1>nul
reg export HKCU HKEY_CURRENT_USER.reg >> APB_Log.txt
cls
echo backup...
ping -n 2 127.0.0.1>nul
reg export HKCR HKEY_CLASSES_ROOT.reg >> APB_Log.txt
cls
echo backup....
ping -n 2 127.0.0.1>nul
reg export HKU HKEY_USERS.reg >> APB_Log.txt
cls
echo backup...
ping -n 2 127.0.0.1>nul
reg export HKCC HK_CURRENT_CONFIG.reg >> APB_Log.txt
cd C:\Users\%username%
cls
echo backup..
ping -n 2 127.0.0.1>nul
cls
echo backup.
cls
echo %getcolor%"Successful"
ping -n 2 127.0.0.1>nul