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
:valorantStart
@echo off
cls
:CheckInterNet
cls
title Check Inter net
echo check inter net

rem ตรวจสอบการเชื่อมต่ออินเทอร์เน็ต
@echo off
ping 8.8.8.8 -n 1 -l 32 >nul
if errorlevel 1 (  
chcp 65001
echo ███╗░░██╗░█████╗░░░░░░░██╗███╗░░██╗████████╗███████╗██████╗░░░░░░░███╗░░██╗███████╗████████╗
echo ████╗░██║██╔══██╗░░░░░░██║████╗░██║╚══██╔══╝██╔════╝██╔══██╗░░░░░░████╗░██║██╔════╝╚══██╔══╝
echo ██╔██╗██║██║░░██║█████╗██║██╔██╗██║░░░██║░░░█████╗░░██████╔╝█████╗██╔██╗██║█████╗░░░░░██║░░░
echo ██║╚████║██║░░██║╚════╝██║██║╚████║░░░██║░░░██╔══╝░░██╔══██╗╚════╝██║╚████║██╔══╝░░░░░██║░░░
echo ██║░╚███║╚█████╔╝░░░░░░██║██║░╚███║░░░██║░░░███████╗██║░░██║░░░░░░██║░╚███║███████╗░░░██║░░░
echo ╚═╝░░╚══╝░╚════╝░░░░░░░╚═╝╚═╝░░╚══╝░░░╚═╝░░░╚══════╝╚═╝░░╚═╝░░░░░░╚═╝░░╚══╝╚══════╝░░░╚═╝░░░
  timeout 16 >nul
  goto menu
) else (
  echo Internet connection active.
)
:checkProgram
title Check Program Riot
cd C:\Riot Games\Riot Client
for %%i in (*RiotClientServices.exe) do (
  if exist "%%i" (
    echo "File %%i exists."
	cls
chcp 65001	 
echo ██████╗░██╗░█████╗░████████╗  ██╗░██████╗  ██████╗░███████╗░█████╗░██████╗░██╗░░░██╗
echo ██╔══██╗██║██╔══██╗╚══██╔══╝  ██║██╔════╝  ██╔══██╗██╔════╝██╔══██╗██╔══██╗╚██╗░██╔╝
echo ██████╔╝██║██║░░██║░░░██║░░░  ██║╚█████╗░  ██████╔╝█████╗░░███████║██║░░██║░╚████╔╝░
echo ██╔══██╗██║██║░░██║░░░██║░░░  ██║░╚═══██╗  ██╔══██╗██╔══╝░░██╔══██║██║░░██║░░╚██╔╝░░
echo ██║░░██║██║╚█████╔╝░░░██║░░░  ██║██████╔╝  ██║░░██║███████╗██║░░██║██████╔╝░░░██║░░░
echo ╚═╝░░╚═╝╚═╝░╚════╝░░░░╚═╝░░░  ╚═╝╚═════╝░  ╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝╚═════╝░░░░╚═╝░░░
 goto startProgram ) else (
    echo "File %%i does not exist."
	cls
	echo you Dont have Riot or you Riot UPDATE
	TIMEOUT 4 > nul
  )
)
:startProgram
rem กำหนดชื่อโปรแกรมที่ต้องการเปิด
cd C:\Riot Games\Riot Client
set program="RiotClientServices.exe"
cls
title start-program
rem เปิดโปรแกรม
echo ██████╗░██╗░█████╗░████████╗  ██████╗░██╗░░░██╗███╗░░██╗███╗░░██╗██╗███╗░░██╗░██████╗░
echo ██╔══██╗██║██╔══██╗╚══██╔══╝  ██╔══██╗██║░░░██║████╗░██║████╗░██║██║████╗░██║██╔════╝░
echo ██████╔╝██║██║░░██║░░░██║░░░  ██████╔╝██║░░░██║██╔██╗██║██╔██╗██║██║██╔██╗██║██║░░██╗░
echo ██╔══██╗██║██║░░██║░░░██║░░░  ██╔══██╗██║░░░██║██║╚████║██║╚████║██║██║╚████║██║░░╚██╗
echo ██║░░██║██║╚█████╔╝░░░██║░░░  ██║░░██║╚██████╔╝██║░╚███║██║░╚███║██║██║░╚███║╚██████╔╝
echo ╚═╝░░╚═╝╚═╝░╚════╝░░░░╚═╝░░░  ╚═╝░░╚═╝░╚═════╝░╚═╝░░╚══╝╚═╝░░╚══╝╚═╝╚═╝░░╚══╝░╚═════╝░
timeout 6 > nul 
start "" "%program%"