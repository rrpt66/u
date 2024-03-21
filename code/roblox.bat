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
:roblox3
@echo off
:erp
set /p ro=" you have roblox yes or no > "
if %ro%== yes goto :have
if %ro%== no goto :downloadrr
:downloadrr
  echo Download.......
  powershell.exe Invoke-WebRequest -Uri "https://www.roblox.com/download/client?os=win" -OutFile "%temp%\Roblox.exe"
start %temp%\Roblox.exe /install /wait 
del %temp%\Roblox.exe

:checkRunning
@echo off
echo Please close roblox
tasklist | find /i "RobloxPlayerBeta.exe" > nul
if %errorlevel% neq 0 goto start
goto checkRunning

:start
goto start
goto checkRunning
:start 
goto stt
:stt
@echo off


:have
echo roblox Boost is not support
:menu
exit
