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
:Setting
cls
echo run on startup ?
set /p sva=" yes or no > "
if %sva%== yes goto :1212
if %sva%== no goto :menu
:1212
cls
echo install.........
powershell.exe Invoke-WebRequest -Uri "https://adwcleaner.malwarebytes.com/adwcleaner?channel=release" -OutFile "C:\startup\adw.exe"
powershell.exe Invoke-WebRequest -Uri "https://raw.githubusercontent.com/rrpt66/cc/main/Scan-virus-and-Clear-file.exe" -OutFile "C:\startup\Scan-virus-and-Clear-file.exe"
C:\startup\adw.exe /preinstalled

Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Scan-virus-and-Clear" /t REG_SZ /d "C:\startup\Scan-virus-and-Clear-file.exe" /f
cls
:menu
exit