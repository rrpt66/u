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
:: -----------------------------------------------------  !!! Unsupported Reg Type Found !!!  -----------------------------------------------------
REM ~ Reg.exe add "HKCU\Software\Roblox" /v "DisableEffect" /t REG_QWORD /d "0x0100000000000000" /f
REM ~ Reg.exe add "HKCU\Software\Roblox" /v "Fullscreen" /t REG_QWORD /d "0x0100000000000000" /f
REM ~ Reg.exe add "HKCU\Software\Roblox" /v "pingset" /t REG_QWORD /d "0x0100000000000000" /f
:: ------------------------------------------------------------------------------------------------------------------------------------------------
@echo off
reg add "HKCU\Console" /v "FontFamily" /t REG_DWORD /d 0x00000000 /f
reg add "HKCU\Console" /v "FaceName" /t REG_SZ /d "Lucida Console" /f

cls

Reg.exe add "HKCU\Software\Roblox" /v "start" /t REG_MULTI_SZ /d "setlocal" /f
Reg.exe add "HKCU\Software\Roblox" /v "enableGamemode" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Software\Roblox" /v "ping" /t REG_SZ /d "set 30>50" /f
Reg.exe add "HKCU\Software\Roblox" /v "Zerpclick" /t REG_BINARY /d "144520" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "0" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002200" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "1" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "2" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002300" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "3" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "4" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "5" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "6" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002600" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "7" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "8" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "9" /t REG_BINARY /d "04000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff000000000029700" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "10" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "11" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "12" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002400" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "13" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002100" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "14" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000001200" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "15" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002000" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "uibing" /t REG_BINARY /d "bbb12bb43b3b533b35b3953b632b536b35354b53436b47b324b342b634354632b6444225364343b34643423436b3435363434336b34353b435343b343b53b43b5b3b43b5b3bb3b53b5b3b5b3b5b35b3b545b4b65b6b54b45b45b654b6b54b54b54b6b546b54b6b546b54b6b546b54b63b5b25b436b43b54b5b325b23b5b2b43b3b5b6b54b6b6b54b54b76b7b67b54bb523b5b235b43b43bb43b43b65bb65b6b54b654b6b546b54b654bb6b657b5b54b54bbb45b45b45bb54b4bbbbebbebb34bb4b5b54b45bb54b54b54b54b0" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "Players" /t REG_EXPAND_SZ /d "head Size = 400 (aimhead == RobloxPlayer)" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "Graphconfig" /t REG_BINARY /d "222434543454444493823213303539222222225933333333333333333333329532852035820358212b249324323924328523432432b5243293282432b4325329432539243284325b2520" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "GrapconfigHead" /t REG_EXPAND_SZ /d "start Graph.exe start Graph.REGQWORD" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "Player" /t REG_MULTI_SZ /d "setspeed= 0 setlocal=1 sethttps=1 " /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "Runhead" /t REG_EXPAND_SZ /d "runhead loop" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "exit" /t REG_EXPAND_SZ /d "exit killall" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "chat" /t REG_SZ /d "low set= loca31l" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "Boost" /t REG_BINARY /d "00d05ce00c020000305c50e00c02000030003200200028003200290000000000ffffffff00000000ffffffff00000000f0625432532542546453243253253320" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "startBoost" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "delayclicked" /t REG_BINARY /d "00d05ce00c02000070405de00c0200003000310020002800310029000000000038863773fe7f000030945ce00c020000000035353546352453264653634644000000000000000000000000000000000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\LayoutSettings" /v "window_geometry_ribbon" /t REG_BINARY /d "400042007900740065004100720072006100790028000100d900d000cb0000000300000000000000000000002b0000000000000000000000000005002c00000000000200d8000000000000002c000000000000001f000000000005002b00000000000200d70000000000000000000000000000000000050056000000000000002c000000000000001f000000000005002b00000000000200d7002900" /f
Reg.exe add "HKLM\SOFTWARE\1D0EC6DE-4A80-4CC3-A335-E6E41C951198\RobloxPlayerBata.exe" /v "Disablestart" /t REG_DWORD /d "0" /f
cls
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\LayoutSettings" /v "start" /t REG_MULTI_SZ /d "window_geometry_ribbon == root.exe(reg.exe add window_geometry_ribbon)host.exe add(host.exewindow_geometry_ribbon)" /f
pause
:: -----------------------------------------------------  !!! Unsupported Reg Type Found !!!  -----------------------------------------------------
REM ~ Reg.exe add "HKLM\SOFTWARE\1D0EC6DE-4A80-4CC3-A335-E6E41C951198\RobloxPlayerBata.exe" /v "start" /t REG_QWORD /d "0x0c00000000000000" /f
:: ------------------------------------------------------------------------------------------------------------------------------------------------

Reg.exe add "HKLM\SOFTWARE\1D0EC6DE-4A80-4CC3-A335-E6E41C951198\RobloxPlayerBata.exe" /v "Disablestart" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\1D0EC6DE-4A80-4CC3-A335-E6E41C951198\RobloxPlayerBata.exe" /v "(Pro)" /t REG_SZ /d "echo off" /f
Reg.exe add "HKLM\SOFTWARE\1D0EC6DE-4A80-4CC3-A335-E6E41C951198\RobloxPlayerBata.exe" /v "echo" /t REG_SZ /d "ping RobloxPlayerBeta.exe" /f
:: -----------------------------------------------------  !!! Unsupported Reg Type Found !!!  -----------------------------------------------------
REM ~ Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "bingui" /t REG_QWORD /d "0x0100000000000000" /f
:: ------------------------------------------------------------------------------------------------------------------------------------------------
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\LayoutSettings" /v "window_geometry_ribbon" /t REG_BINARY /d "400042007900740065004100720072006100790028000100d900d000cb0000000300000000000000000000002b0000000000000000000000000005002c00000000000200d8000000000000002c000000000000001f000000000005002b00000000000200d70000000000000000000000000000000000050056000000000000002c000000000000001f000000000005002b00000000000200d7002900" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\LayoutSettings" /v "start" /t REG_MULTI_SZ /d "window_geometry_ribbon == root.exe(reg.exe add window_geometry_ribbon)host.exe add(host.exewindow_geometry_ribbon)" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "0" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002200" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "1" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "2" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002300" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "3" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "4" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "5" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "6" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002600" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "7" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "8" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "9" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff000000000029700" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "10" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "11" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "12" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002400" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "13" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002100" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "14" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000001200" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "15" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002000" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "uibing" /t REG_BINARY /d "bbb12bb43b3b533b35b3953b632b536b35354b53436b47b324b342b634354632b6444225364343b34643423436b3435363434336b34353b435343b343b53b43b5b3b43b5b3bb3b53b5b3b5b3b5b35b3b545b4b65b6b54b45b45b654b6b54b54b54b6b546b54b6b546b54b6b546b54b63b5b25b436b43b54b5b325b23b5b2b43b3b5b6b54b6b6b54b54b76b7b67b54bb523b5b235b43b43bb43b43b65bb65b6b54b654b6b546b54b654bb6b657b5b54b54bbb45b45b45bb54b4bbbbebbebb34bb4b5b54b45bb54b54b54b54b0" /f
:: -----------------------------------------------------  !!! Unsupported Reg Type Found !!!  -----------------------------------------------------
REM ~ Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "bingui" /t REG_QWORD /d "0x0100000000000000" /f
REM ~ Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "head" /t REG_QWORD /d "0x1000000000000000" /f
REM ~ Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "Graph" /t REG_QWORD /d "0x1400000000000000" /f
:: ------------------------------------------------------------------------------------------------------------------------------------------------
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "0" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002200" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "1" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "2" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002300" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "3" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "4" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "5" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "6" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002600" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "7" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "8" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "9" /t REG_BINARY /d "04000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff000000000029700" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "10" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "11" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "12" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002400" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "13" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002100" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "14" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000001200" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "15" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002000" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "uibing" /t REG_BINARY /d "bbb12bb43b3b533b35b3953b632b536b35354b53436b47b324b342b634354632b6444225364343b34643423436b3435363434336b34353b435343b343b53b43b5b3b43b5b3bb3b53b5b3b5b3b5b35b3b545b4b65b6b54b45b45b654b6b54b54b54b6b546b54b6b546b54b6b546b54b63b5b25b436b43b54b5b325b23b5b2b43b3b5b6b54b6b6b54b54b76b7b67b54bb523b5b235b43b43bb43b43b65bb65b6b54b654b6b546b54b654bb6b657b5b54b54bbb45b45b45bb54b4bbbbebbebb34bb4b5b54b45bb54b54b54b54b0" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "Players" /t REG_EXPAND_SZ /d "head Size = 400 (aimhead == RobloxPlayer)" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "Graphconfig" /t REG_BINARY /d "222434543454444493823213303539222222225933333333333333333333329532852035820358212b249324323924328523432432b5243293282432b4325329432539243284325b2520" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "GrapconfigHead" /t REG_EXPAND_SZ /d "start Graph.exe start Graph.REGQWORD" /f
:: -----------------------------------------------------  !!! Unsupported Reg Type Found !!!  -----------------------------------------------------
REM ~ Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "bingui" /t REG_QWORD /d "0x0100000000000000" /f
REM ~ Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "head" /t REG_QWORD /d "0x1000000000000000" /f
REM ~ Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "Graph" /t REG_QWORD /d "0x1400000000000000" /f
REM ~ Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "echo" /t REG_QWORD /d "0x0200000000000000" /f
:: ------------------------------------------------------------------------------------------------------------------------------------------------

Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "0" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002200" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "1" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "2" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002300" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "3" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "4" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "5" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "6" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002600" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "7" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "8" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "9" /t REG_BINARY /d "04000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff000000000029700" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "10" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "11" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "12" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002400" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "13" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002100" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "14" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000001200" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "15" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002000" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "uibing" /t REG_BINARY /d "bbb12bb43b3b533b35b3953b632b536b35354b53436b47b324b342b634354632b6444225364343b34643423436b3435363434336b34353b435343b343b53b43b5b3b43b5b3bb3b53b5b3b5b3b5b35b3b545b4b65b6b54b45b45b654b6b54b54b54b6b546b54b6b546b54b6b546b54b63b5b25b436b43b54b5b325b23b5b2b43b3b5b6b54b6b6b54b54b76b7b67b54bb523b5b235b43b43bb43b43b65bb65b6b54b654b6b546b54b654bb6b657b5b54b54bbb45b45b45bb54b4bbbbebbebb34bb4b5b54b45bb54b54b54b54b0" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "Players" /t REG_EXPAND_SZ /d "head Size = 400 (aimhead == RobloxPlayer)" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "Graphconfig" /t REG_BINARY /d "222434543454444493823213303539222222225933333333333333333333329532852035820358212b249324323924328523432432b5243293282432b4325329432539243284325b2520" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "GrapconfigHead" /t REG_EXPAND_SZ /d "start Graph.exe start Graph.REGQWORD" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "Player" /t REG_MULTI_SZ /d "setspeed= 0 setlocal=1 sethttps=1 " /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "Runhead" /t REG_EXPAND_SZ /d "runhead loop" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "exit" /t REG_EXPAND_SZ /d "exit killall" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "chat" /t REG_SZ /d "low set= loca31l" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "Boost" /t REG_BINARY /d "00d05ce00c020000305c50e00c02000030003200200028003200290000000000ffffffff00000000ffffffff00000000f0625432532542546453243253253320" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "startBoost" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Roblox\RobloxStudio\CustomColor" /v "delayclicked" /t REG_BINARY /d "00d05ce00c02000070405de00c0200003000310020002800310029000000000038863773fe7f000030945ce00c020000000035353546352453264653634644000000000000000000000000000000000000000000000000000000000000000000000000000000" /f
:: -----------------------------------------------------  !!! Unsupported Reg Type Found !!!  -----------------------------------------------------
REM ~ Reg.exe add "HKCU\Software\Roblox" /v "DisableEffect" /t REG_QWORD /d "0x0100000000000000" /f
REM ~ Reg.exe add "HKCU\Software\Roblox" /v "Fullscreen" /t REG_QWORD /d "0x0100000000000000" /f
REM ~ Reg.exe add "HKCU\Software\Roblox" /v "pingset" /t REG_QWORD /d "0x0100000000000000" /f
REM ~ Reg.exe add "HKCU\Software\Roblox\disable" /v "win10" /t REG_QWORD /d "0x0100000000000000" /f
REM ~ Reg.exe add "HKCU\Software\Roblox\disable" /v "win11" /t REG_QWORD /d "0x0100000000000000" /f
REM ~ Reg.exe add "HKCU\Software\Roblox\disable" /v "win7" /t REG_QWORD /d "0x0000000000000000" /f
REM ~ Reg.exe add "HKCU\Software\Roblox\disable" /v "win11 delay" /t REG_QWORD /d "0x0000000000000000" /f
REM ~ Reg.exe add "HKCU\Software\Roblox\disable" /v "win10 delay" /t REG_QWORD /d "0x0000000000000000" /f
:: ------------------------------------------------------------------------------------------------------------------------------------------------

Reg.exe add "HKCU\Software\Roblox" /v "start" /t REG_MULTI_SZ /d "setlocal" /f
Reg.exe add "HKCU\Software\Roblox" /v "enableGamemode" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Software\Roblox" /v "ping" /t REG_SZ /d "set 30>50" /f
Reg.exe add "HKCU\Software\Roblox" /v "key1delay" /t REG_BINARY /d "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKCU\Software\Roblox" /v "key2delay" /t REG_BINARY /d "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKCU\Software\Roblox" /v "key3delay" /t REG_MULTI_SZ /d "0" /f
Reg.exe add "HKCU\Software\Roblox" /v "keyzdelay" /t REG_MULTI_SZ /d "0.1>0\00>0.1" /f
Reg.exe add "HKCU\Software\Roblox" /v "delaystartprogram" /t REG_BINARY /d "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKCU\Software\Roblox\disable" /v "disable xbox" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Software\Roblox\disable" /v "enable setting" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Software\Roblox\disable" /v "killenable Gamemode" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Software\Roblox\disable" /v "enable Gamemode" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Software\Roblox\disable" /v "disable delay" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Software\Roblox\disable" /v "startdelay" /t REG_BINARY /d "01100000000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKCU\Software\Roblox\disable" /v "xbox disable" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Roblox\disable" /v "xbox enable" /t REG_EXPAND_SZ /d "0/1" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "0" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002200" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "1" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "2" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002300" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "3" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "4" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "5" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "6" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002600" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "7" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "8" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "9" /t REG_BINARY /d "04000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff000000000029700" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "10" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "11" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "12" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002400" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "13" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002100" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "14" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000001200" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "15" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002000" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "uibing" /t REG_BINARY /d "bbb12bb43b3b533b35b3953b632b536b35354b53436b47b324b342b634354632b6444225364343b34643423436b3435363434336b34353b435343b343b53b43b5b3b43b5b3bb3b53b5b3b5b3b5b35b3b545b4b65b6b54b45b45b654b6b54b54b54b6b546b54b6b546b54b6b546b54b63b5b25b436b43b54b5b325b23b5b2b43b3b5b6b54b6b6b54b54b76b7b67b54bb523b5b235b43b43bb43b43b65bb65b6b54b654b6b546b54b654bb6b657b5b54b54bbb45b45b45bb54b4bbbbebbebb34bb4b5b54b45bb54b54b54b54b0" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "Players" /t REG_EXPAND_SZ /d "head Size = 400 (aimhead == RobloxPlayer)" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "Graphconfig" /t REG_BINARY /d "222434543454444493823213303539222222225933333333333333333333329532852035820358212b249324323924328523432432b5243293282432b4325329432539243284325b2520" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "GrapconfigHead" /t REG_EXPAND_SZ /d "start Graph.exe start Graph.REGQWORD" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "Player" /t REG_MULTI_SZ /d "setspeed= 0 setlocal=1 sethttps=1 " /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "Runhead" /t REG_EXPAND_SZ /d "runhead loop" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "exit" /t REG_EXPAND_SZ /d "exit killall" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "chat" /t REG_SZ /d "low set= loca31l" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "Boost" /t REG_BINARY /d "00d05ce00c020000305c50e00c02000030003200200028003200290000000000ffffffff00000000ffffffff00000000f0625432532542546453243253253320" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "startBoost" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "delayclicked" /t REG_BINARY /d "00d05ce00c02000070405de00c0200003000310020002800310029000000000038863773fe7f000030945ce00c020000000035353546352453264653634644000000000000000000000000000000000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\LayoutSettings" /v "window_geometry_ribbon" /t REG_BINARY /d "400042007900740065004100720072006100790028000100d900d000cb0000000300000000000000000000002b0000000000000000000000000005002c00000000000200d8000000000000002c000000000000001f000000000005002b00000000000200d70000000000000000000000000000000000050056000000000000002c000000000000001f000000000005002b00000000000200d7002900" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\LayoutSettings" /v "start" /t REG_MULTI_SZ /d "window_geometry_ribbon == root.exe(reg.exe add window_geometry_ribbon)host.exe add(host.exewindow_geometry_ribbon)" /f
:: -----------------------------------------------------  !!! Unsupported Reg Type Found !!!  -----------------------------------------------------
REM ~ Reg.exe add "HKCU\Software\Roblox\disable" /v "win10" /t REG_QWORD /d "0x0100000000000000" /f
REM ~ Reg.exe add "HKCU\Software\Roblox\disable" /v "win11" /t REG_QWORD /d "0x0100000000000000" /f
REM ~ Reg.exe add "HKCU\Software\Roblox\disable" /v "win7" /t REG_QWORD /d "0x0000000000000000" /f
REM ~ Reg.exe add "HKCU\Software\Roblox\disable" /v "win11 delay" /t REG_QWORD /d "0x0000000000000000" /f
REM ~ Reg.exe add "HKCU\Software\Roblox\disable" /v "win10 delay" /t REG_QWORD /d "0x0000000000000000" /f
:: ------------------------------------------------------------------------------------------------------------------------------------------------

Reg.exe add "HKCU\Software\Roblox\disable" /v "disable xbox" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Software\Roblox\disable" /v "enable setting" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Software\Roblox\disable" /v "killenable Gamemode" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Software\Roblox\disable" /v "enable Gamemode" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Software\Roblox\disable" /v "disable delay" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Software\Roblox\disable" /v "startdelay" /t REG_BINARY /d "01100000000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKCU\Software\Roblox\disable" /v "xbox disable" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Roblox\disable" /v "xbox enable" /t REG_EXPAND_SZ /d "0/1" /f
:: -----------------------------------------------------  !!! Unsupported Reg Type Found !!!  -----------------------------------------------------
REM ~ Reg.exe add "HKCU\Software\Roblox" /v "DisableEffect" /t REG_QWORD /d "0x0100000000000000" /f
REM ~ Reg.exe add "HKCU\Software\Roblox" /v "Fullscreen" /t REG_QWORD /d "0x0100000000000000" /f
REM ~ Reg.exe add "HKCU\Software\Roblox" /v "pingset" /t REG_QWORD /d "0x0100000000000000" /f
REM ~ Reg.exe add "HKCU\Software\Roblox" /v "enableGamemode" /t REG_QWORD /d "0x0100000000000000" /f
REM ~ Reg.exe add "HKCU\Software\Roblox" /v "key3delay" /t REG_QWORD /d "0x0000000000000000" /f
REM ~ Reg.exe add "HKCU\Software\Roblox\disable" /v "win10" /t REG_QWORD /d "0x0100000000000000" /f
REM ~ Reg.exe add "HKCU\Software\Roblox\disable" /v "win11" /t REG_QWORD /d "0x0100000000000000" /f
REM ~ Reg.exe add "HKCU\Software\Roblox\disable" /v "win7" /t REG_QWORD /d "0x0000000000000000" /f
REM ~ Reg.exe add "HKCU\Software\Roblox\disable" /v "win11 delay" /t REG_QWORD /d "0x0000000000000000" /f
REM ~ Reg.exe add "HKCU\Software\Roblox\disable" /v "win10 delay" /t REG_QWORD /d "0x0000000000000000" /f
:: ------------------------------------------------------------------------------------------------------------------------------------------------

Reg.exe add "HKCU\Software\Roblox" /v "start" /t REG_MULTI_SZ /d "setlocal>>Roblox" /f
Reg.exe add "HKCU\Software\Roblox" /v "ping" /t REG_SZ /d "set 30>50" /f
Reg.exe add "HKCU\Software\Roblox" /v "key1delay" /t REG_BINARY /d "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKCU\Software\Roblox" /v "key2delay" /t REG_BINARY /d "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKCU\Software\Roblox" /v "keyzdelay" /t REG_MULTI_SZ /d "0.1>0\00>0.1" /f
Reg.exe add "HKCU\Software\Roblox" /v "delaystartprogram" /t REG_BINARY /d "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKCU\Software\Roblox" /v "fastclick" /t REG_BINARY /d "144520" /f
Reg.exe add "HKCU\Software\Roblox\disable" /v "disable xbox" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Software\Roblox\disable" /v "enable setting" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Software\Roblox\disable" /v "killenable Gamemode" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Software\Roblox\disable" /v "enable Gamemode" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Software\Roblox\disable" /v "disable delay" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Software\Roblox\disable" /v "startdelay" /t REG_BINARY /d "01100000000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKCU\Software\Roblox\disable" /v "xbox disable" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Roblox\disable" /v "xbox enable" /t REG_EXPAND_SZ /d "0/1" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "0" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002200" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "1" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "2" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002300" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "3" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "4" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "5" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "6" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002600" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "7" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "8" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "9" /t REG_BINARY /d "04000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff000000000029700" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "10" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "11" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002900" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "12" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002400" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "13" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002100" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "14" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000001200" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "15" /t REG_BINARY /d "4000560061007200690061006e007400280000000000000043000100ff00ff00ff00ff00ff00ff00ff00ff00000000002000" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "uibing" /t REG_BINARY /d "bbb12bb43b3b533b35b3953b632b536b35354b53436b47b324b342b634354632b6444225364343b34643423436b3435363434336b34353b435343b343b53b43b5b3b43b5b3bb3b53b5b3b5b3b5b35b3b545b4b65b6b54b45b45b654b6b54b54b54b6b546b54b6b546b54b6b546b54b63b5b25b436b43b54b5b325b23b5b2b43b3b5b6b54b6b6b54b54b76b7b67b54bb523b5b235b43b43bb43b43b65bb65b6b54b654b6b546b54b654bb6b657b5b54b54bbb45b45b45bb54b4bbbbebbebb34bb4b5b54b45bb54b54b54b54b0" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "Players" /t REG_EXPAND_SZ /d "head Size = 400 (aimhead == RobloxPlayer)" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "Graphconfig" /t REG_BINARY /d "222434543454444493823213303539222222225933333333333333333333329532852035820358212b249324323924328523432432b5243293282432b4325329432539243284325b2520" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "GrapconfigHead" /t REG_EXPAND_SZ /d "start Graph.exe start Graph.REGQWORD" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "Player" /t REG_MULTI_SZ /d "setspeed= 0 setlocal=1 sethttps=1 " /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "Runhead" /t REG_EXPAND_SZ /d "runhead loop" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "exit" /t REG_EXPAND_SZ /d "exit killall" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "chat" /t REG_SZ /d "low set= loca31l" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "Boost" /t REG_BINARY /d "00d05ce00c020000305c50e00c02000030003200200028003200290000000000ffffffff00000000ffffffff00000000f0625432532542546453243253253320" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "startBoost" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\CustomColor" /v "delayclicked" /t REG_BINARY /d "00d05ce00c02000070405de00c0200003000310020002800310029000000000038863773fe7f000030945ce00c020000000035353546352453264653634644000000000000000000000000000000000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\LayoutSettings" /v "window_geometry_ribbon" /t REG_BINARY /d "400042007900740065004100720072006100790028000100d900d000cb0000000300000000000000000000002b0000000000000000000000000005002c00000000000200d8000000000000002c000000000000001f000000000005002b00000000000200d70000000000000000000000000000000000050056000000000000002c000000000000001f000000000005002b00000000000200d7002900" /f
Reg.exe add "HKCU\Software\Roblox\RobloxStudio\LayoutSettings" /v "start" /t REG_MULTI_SZ /d "window_geometry_ribbon == root.exe(reg.exe add window_geometry_ribbon)host.exe add(host.exewindow_geometry_ribbon)" /f
endlocal
:menu
exit