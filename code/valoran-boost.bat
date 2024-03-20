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
:valo
@echo off
title Question
cls
echo boost valorant??
SET /p choix=" yes or No  >  "
if %choix%== yes Goto :valob
if %choix%== no Goto :menu
:valob
title Question
echo loadding
ping -n 4 127.0.0.1>nul
echo boost
ping -n 2 127.0.0.1>nul

Reg.exe add "HKCU\Software\ChangeTracker\Valorant" /v "run" /t REG_SZ /d "C:\Riot Games\VALORANT\live\VALORANT.exe -high" /f
goto menu
:menu
exit
