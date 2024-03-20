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
@echo off
del C:\AdwCleaner\Logs\AdwCleaner[S00].txt > nul
echo cancel Hide file all.......
attrib -h -r -s /s /d *.* 
cls
echo Download Awd......
powershell.exe Invoke-WebRequest -Uri "https://adwcleaner.malwarebytes.com/adwcleaner?channel=release" -OutFile "%temp%\adw.exe"
echo Install Awd............
%temp%\adw.exe /preinstalled
cls
echo scan................
%temp%\adw.exe /eula /scan /noreboot
cls
echo clearing................
%temp%\adw.exe /eula /clean /noreboot
cls
C:\AdwCleaner\Logs\AdwCleaner[S00].txt
TIMEOUT 3 /nobreak > nul
echo -Delete program scan virus....
TIMEOUT 3 /nobreak > nul
%temp%\adw.exe /uninstall  & del /q %temp%\adw.exe