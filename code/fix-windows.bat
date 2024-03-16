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
:fixed
@echo off
cd %systemroot%\system32
chcp 65001 >nul 2>&1
Mode 120,30
:: Blank/Color Character
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (set "DEL=%%a" & set "COL=%%b")
cls
echo                                            ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
echo                                                   To Windows FIX by Siwat 
echo                                            ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
echo.
echo                                            ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
echo                                                   Press ENTER to continue   
echo                                            ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
echo.  
echo.
pause > nul

@echo off

cls

:: Repair Windows Script


:: Repair Windows Update components
DISM.exe /Online /Cleanup-image /Restorehealth

:: Repair system files
sfc /scannow

:: Repair Windows Firewall
netsh advfirewall reset


:: Clear temporary files
del /F /Q %temp%\*

:: Rebuild icon cache
ie4uinit.exe -ClearIconCache
taskkill /IM explorer.exe /F
DEL "%localappdata%\IconCache.db" /A
start explorer.exe

:: Re-register Windows Store apps
powershell -Command "Get-AppXPackage -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register '$($_.InstallLocation)\AppXManifest.xml'}"

:: Re-register Windows system apps
for /f "delims=" %%G in ('dir /b %windir%\AppxManifest.xml') do (
    echo Processing: %%G
    start /w powershell -command "Add-AppxPackage -DisableDevelopmentMode -Register $env:windir\AppxManifest.xml"
)

:: Fix common Windows issues
DISM.exe /Online /Cleanup-Image /CheckHealth
DISM.exe /Online /Cleanup-Image /ScanHealth


:: DLL registration
for %%i in (%windir%\system32\*.dll) do regsvr32.exe /s "%%i"
for %%i in (%windir%\syswow64\*.dll) do regsvr32.exe /s "%%i"

:: Disk and boot-related repairs
chkdsk C: /f /r /x
bootrec /fixmbr
bootrec /fixboot
bootrec /rebuildbcd

:: Clear DNS cache
ipconfig /flushdns

:: Reset Winsock Catalog
netsh winsock reset

:: Reset TCP/IP stack
netsh int ip reset

:: Reset network adapters
netsh winsock reset catalog
netsh int ipv4 reset reset.log
netsh int ipv6 reset reset.log

:: Reset Wi-Fi configuration
netsh int ip reset reset.log

:: Flush ARP cache
netsh interface ip delete arpcache

:: Reset network settings
netsh winsock reset all
netcfg -d
ipconfig /release
ipconfig /renew

echo Windows repair tasks completed.

cls

::Finished

cd %systemroot%\system32
chcp 65001 >nul 2>&1
cls
color 9


echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                               ███████╗██╗███╗░░██╗██╗░██████╗██╗░░██╗███████╗██████╗░  ██╗██╗██╗
echo                               ██╔════╝██║████╗░██║██║██╔════╝██║░░██║██╔════╝██╔══██╗  ██║██║██║
echo                               █████╗░░██║██╔██╗██║██║╚█████╗░███████║█████╗░░██║░░██║  ██║██║██║
echo                               ██╔══╝░░██║██║╚████║██║░╚═══██╗██╔══██║██╔══╝░░██║░░██║  ╚═╝╚═╝╚═╝
echo                               ██║░░░░░██║██║░╚███║██║██████╔╝██║░░██║███████╗██████╔╝  ██╗██╗██╗
echo                               ╚═╝░░░░░╚═╝╚═╝░░╚══╝╚═╝╚═════╝░╚═╝░░╚═╝╚══════╝╚═════╝░  ╚═╝╚═╝╚═╝
echo.
echo.
echo.
echo.
echo.
echo                                               Do you want to Restart your PC ?     
echo                                       Press [Y] to Restart your PC , Press [N] To EXIT  
echo.
echo.
echo.
echo.

@ECHO Off

    

    SET /P yesno=Choose Your Option:
    IF "%yesno%"=="y" GOTO Confirmation
    IF "%yesno%"=="Y" GOTO Confirmation
    IF "%yesno%"=="n" GOTO End
    IF "%yesno%"=="N" GOTO End
    
    :Confirmation
    
    ECHO System is going to Restart now
    
    shutdown /r /t 0 
    
    GOTO EOF
    :End
    
    ECHO System Restart cancelled
    
    TIMEOUT 5 >nul
    
    :EOF
    exit