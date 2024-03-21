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
:AMD
cls
setlocal
title AMD Boostecho                                
echo                                ███████╗███████╗██████╗░███████╗░█████╗░██╗░░██╗
echo                                ╚════██║██╔════╝██╔══██╗╚════██║██╔══██╗╚██╗██╔╝
echo                                ░░███╔═╝█████╗░░██████╔╝░░███╔═╝███████║░╚███╔╝░
echo                                ██╔══╝░░██╔══╝░░██╔══██╗██╔══╝░░██╔══██║░██╔██╗░
echo                                ███████╗███████╗██║░░██║███████╗██║░░██║██╔╝╚██╗
echo                                ╚══════╝╚══════╝╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝░░
:: Apill-fuse-project
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PerfLevelSrc" /t REG_DWORD /d "2222" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerLevel" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerLevelAC" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "PerfLevelSrc" /t REG_DWORD /d "2222" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "PowerMizerEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "PowerMizerLevel" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "PowerMizerLevelAC" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "PerfLevelSrc" /t REG_DWORD /d "2222" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "PowerMizerEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "PowerMizerLevel" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "PowerMizerLevelAC" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "PerfLevelSrc" /t REG_DWORD /d "2222" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "PowerMizerEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "PowerMizerLevel" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "PowerMizerLevelAC" /t REG_DWORD /d "0" /f
REM ; Disable AMD Kernel Logging
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MSFTProxy\Enum" /v "Kernel Driver Event Logging Policy" /t REG_SZ /d "Disabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableeRecord" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableAmdLog" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_EVENT_LOG" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_EnableEventLog" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_LoggingControl" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "DisableeRecord" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "EnableAmdLog" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "DisableeRecord" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "EnableAmdLog" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "KMD_EVENT_LOG" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "KMD_EnableEventLog" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "KMD_LoggingControl" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD" /v "DisableeRecord" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD" /v "EnableAmdLog" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "DisableeRecord" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "EnableAmdLog" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "KMD_EVENT_LOG" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "KMD_EnableEventLog" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "KMD_LoggingControl" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD" /v "DisableeRecord" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD" /v "EnableAmdLog" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "DisableeRecord" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "EnableAmdLog" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "KMD_EVENT_LOG" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "KMD_EnableEventLog" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "KMD_LoggingControl" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD" /v "DisableeRecord" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD" /v "EnableAmdLog" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "DisableeRecord" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "EnableAmdLog" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_EVENT_LOG" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_EnableEventLog" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_LoggingControl" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD" /v "DisableeRecord" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD" /v "EnableAmdLog" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "DisableeRecord" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "EnableAmdLog" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_EVENT_LOG" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_EnableEventLog" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_LoggingControl" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD" /v "DisableeRecord" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD" /v "EnableAmdLog" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "DisableeRecord" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "EnableAmdLog" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_EVENT_LOG" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_EnableEventLog" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_LoggingControl" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD" /v "DisableeRecord" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD" /v "EnableAmdLog" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "DisableeRecord" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "EnableAmdLog" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_EVENT_LOG" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_EnableEventLog" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_LoggingControl" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD" /v "DisableeRecord" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD" /v "EnableAmdLog" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "DisableeRecord" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "EnableAmdLog" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_EVENT_LOG" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_EnableEventLog" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_LoggingControl" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD" /v "DisableeRecord" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD" /v "EnableAmdLog" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "DisableeRecord" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "EnableAmdLog" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_EVENT_LOG" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_EnableEventLog" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_LoggingControl" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD" /v "DisableeRecord" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD" /v "EnableAmdLog" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MSFTProxy\Enum" /v "AMD External Events Service Logging Policy" /t REG_SZ /d "Disabled" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\AMD External Events Utility" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Atierecord" /v "eRecordEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Atierecord" /v "eRecordEnablePopups" /t REG_DWORD /d "0" /f
REM ; disable deep sleep state
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MSFTProxy\Enum" /v "Deep Sleep Power State Mode" /t REG_SZ /d "Disabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableSamuLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableVceLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableXdmaLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_DisableLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_EnableSclkDeepSleepAboveLow" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "DisableSamuLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "DisableVceLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "DisableXdmaLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "PP_DisableLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "PP_EnableSclkDeepSleepAboveLow" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "DisableSamuLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "DisableVceLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "DisableXdmaLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "PP_DisableLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "PP_EnableSclkDeepSleepAboveLow" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "DisableSamuLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "DisableVceLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "DisableXdmaLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "PP_DisableLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "PP_EnableSclkDeepSleepAboveLow" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "DisableSamuLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "DisableVceLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "DisableXdmaLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "PP_DisableLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "PP_EnableSclkDeepSleepAboveLow" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "DisableSamuLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "DisableVceLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "DisableXdmaLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "PP_DisableLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "PP_EnableSclkDeepSleepAboveLow" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "DisableSamuLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "DisableVceLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "DisableXdmaLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "PP_DisableLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "PP_EnableSclkDeepSleepAboveLow" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "DisableSamuLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "DisableVceLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "DisableXdmaLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "PP_DisableLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "PP_EnableSclkDeepSleepAboveLow" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "DisableSamuLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "DisableVceLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "DisableXdmaLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "PP_DisableLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "PP_EnableSclkDeepSleepAboveLow" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "DisableSamuLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "DisableVceLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "DisableXdmaLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "PP_DisableLightSleep" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "PP_EnableSclkDeepSleepAboveLow" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "1" /f
REM ; ULPS Disable
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MSFTProxy\Enum" /v "ULPS GPU Sleep Mode" /t REG_SZ /d "Disabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUlps_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUlps" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_ULPSDelayIntervalInMilliSeconds" /t REG_DWORD /d "6291456" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_DisableULPS" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "EnableUlps_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "EnableUlps" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "PP_ULPSDelayIntervalInMilliSeconds" /t REG_DWORD /d "6291456" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "PP_DisableULPS" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "EnableUlps_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "EnableUlps" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "PP_ULPSDelayIntervalInMilliSeconds" /t REG_DWORD /d "6291456" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "PP_DisableULPS" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "EnableUlps_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "EnableUlps" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "PP_ULPSDelayIntervalInMilliSeconds" /t REG_DWORD /d "6291456" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "PP_DisableULPS" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "EnableUlps_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "EnableUlps" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "PP_ULPSDelayIntervalInMilliSeconds" /t REG_DWORD /d "6291456" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "PP_DisableULPS" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "EnableUlps_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "EnableUlps" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "PP_ULPSDelayIntervalInMilliSeconds" /t REG_DWORD /d "6291456" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "PP_DisableULPS" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "EnableUlps_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "EnableUlps" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "PP_ULPSDelayIntervalInMilliSeconds" /t REG_DWORD /d "6291456" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "PP_DisableULPS" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "EnableUlps_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "EnableUlps" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "PP_ULPSDelayIntervalInMilliSeconds" /t REG_DWORD /d "6291456" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "PP_DisableULPS" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "EnableUlps_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "EnableUlps" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "PP_ULPSDelayIntervalInMilliSeconds" /t REG_DWORD /d "6291456" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "PP_DisableULPS" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "EnableUlps_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "EnableUlps" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "PP_ULPSDelayIntervalInMilliSeconds" /t REG_DWORD /d "6291456" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "PP_DisableULPS" /t REG_DWORD /d "1" /f
REM ; GPU Virtualization
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MSFTProxy\Enum" /v "GPU Virtualization Service Mode" /t REG_SZ /d "Enabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableGPUVirtulizationFeature" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_EnableLDASupportForVirtualMachine" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_EnableParaVirtualization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_EnableVirtualDalSupport" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "EnableGPUVirtulizationFeature" /t REG_BINARY /d "3100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "EnableGPUVirtulizationFeature" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "KMD_EnableLDASupportForVirtualMachine" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "KMD_EnableParaVirtualization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "KMD_EnableVirtualDalSupport" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD" /v "EnableGPUVirtulizationFeature" /t REG_BINARY /d "3100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "EnableGPUVirtulizationFeature" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "KMD_EnableLDASupportForVirtualMachine" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "KMD_EnableParaVirtualization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "KMD_EnableVirtualDalSupport" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD" /v "EnableGPUVirtulizationFeature" /t REG_BINARY /d "3100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "EnableGPUVirtulizationFeature" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "KMD_EnableLDASupportForVirtualMachine" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "KMD_EnableParaVirtualization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "KMD_EnableVirtualDalSupport" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD" /v "EnableGPUVirtulizationFeature" /t REG_BINARY /d "3100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "EnableGPUVirtulizationFeature" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_EnableLDASupportForVirtualMachine" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_EnableParaVirtualization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_EnableVirtualDalSupport" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD" /v "EnableGPUVirtulizationFeature" /t REG_BINARY /d "3100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "EnableGPUVirtulizationFeature" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_EnableLDASupportForVirtualMachine" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_EnableParaVirtualization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_EnableVirtualDalSupport" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD" /v "EnableGPUVirtulizationFeature" /t REG_BINARY /d "3100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "EnableGPUVirtulizationFeature" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_EnableLDASupportForVirtualMachine" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_EnableParaVirtualization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_EnableVirtualDalSupport" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD" /v "EnableGPUVirtulizationFeature" /t REG_BINARY /d "3100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "EnableGPUVirtulizationFeature" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_EnableLDASupportForVirtualMachine" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_EnableParaVirtualization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_EnableVirtualDalSupport" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD" /v "EnableGPUVirtulizationFeature" /t REG_BINARY /d "3100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "EnableGPUVirtulizationFeature" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_EnableLDASupportForVirtualMachine" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_EnableParaVirtualization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_EnableVirtualDalSupport" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD" /v "EnableGPUVirtulizationFeature" /t REG_BINARY /d "3100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "EnableGPUVirtulizationFeature" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_EnableLDASupportForVirtualMachine" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_EnableParaVirtualization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_EnableVirtualDalSupport" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD" /v "EnableGPUVirtulizationFeature" /t REG_BINARY /d "3100" /f
REM ; GPU Queue to 64
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MSFTProxy\Enum" /v "GPU Buffer Queue Override" /t REG_SZ /d "64T" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "FlipQueueSize" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "Main3D" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "Main3D_DEF" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "Main3D_NA" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "MTMaxWorkerThreads" /t REG_DWORD /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "MTMinWorkerThreads" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "FlipQueueSize" /t REG_BINARY /d "363400" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Main3D" /t REG_BINARY /d "3634000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Main3D_DEF" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Main3D_NA" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "MTMaxWorkerThreads" /t REG_BINARY /d "363400" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "MTMinWorkerThreads" /t REG_BINARY /d "333200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "FlipQueueSize" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "Main3D" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "Main3D_DEF" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "Main3D_NA" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "MTMaxWorkerThreads" /t REG_DWORD /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "MTMinWorkerThreads" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD" /v "FlipQueueSize" /t REG_BINARY /d "363400" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD" /v "Main3D" /t REG_BINARY /d "3634000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD" /v "Main3D_DEF" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD" /v "Main3D_NA" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD" /v "MTMaxWorkerThreads" /t REG_BINARY /d "363400" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD" /v "MTMinWorkerThreads" /t REG_BINARY /d "333200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "FlipQueueSize" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "Main3D" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "Main3D_DEF" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "Main3D_NA" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "MTMaxWorkerThreads" /t REG_DWORD /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "MTMinWorkerThreads" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD" /v "FlipQueueSize" /t REG_BINARY /d "363400" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD" /v "Main3D" /t REG_BINARY /d "3634000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD" /v "Main3D_DEF" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD" /v "Main3D_NA" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD" /v "MTMaxWorkerThreads" /t REG_BINARY /d "363400" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD" /v "MTMinWorkerThreads" /t REG_BINARY /d "333200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "FlipQueueSize" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "Main3D" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "Main3D_DEF" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "Main3D_NA" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "MTMaxWorkerThreads" /t REG_DWORD /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "MTMinWorkerThreads" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD" /v "FlipQueueSize" /t REG_BINARY /d "363400" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD" /v "Main3D" /t REG_BINARY /d "3634000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD" /v "Main3D_DEF" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD" /v "Main3D_NA" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD" /v "MTMaxWorkerThreads" /t REG_BINARY /d "363400" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD" /v "MTMinWorkerThreads" /t REG_BINARY /d "333200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "FlipQueueSize" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "Main3D" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "Main3D_DEF" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "Main3D_NA" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "MTMaxWorkerThreads" /t REG_DWORD /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "MTMinWorkerThreads" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD" /v "FlipQueueSize" /t REG_BINARY /d "363400" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD" /v "Main3D" /t REG_BINARY /d "3634000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD" /v "Main3D_DEF" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD" /v "Main3D_NA" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD" /v "MTMaxWorkerThreads" /t REG_BINARY /d "363400" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD" /v "MTMinWorkerThreads" /t REG_BINARY /d "333200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "FlipQueueSize" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "Main3D" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "Main3D_DEF" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "Main3D_NA" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "MTMaxWorkerThreads" /t REG_DWORD /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "MTMinWorkerThreads" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD" /v "FlipQueueSize" /t REG_BINARY /d "363400" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD" /v "Main3D" /t REG_BINARY /d "3634000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD" /v "Main3D_DEF" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD" /v "Main3D_NA" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD" /v "MTMaxWorkerThreads" /t REG_BINARY /d "363400" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD" /v "MTMinWorkerThreads" /t REG_BINARY /d "333200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "FlipQueueSize" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "Main3D" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "Main3D_DEF" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "Main3D_NA" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "MTMaxWorkerThreads" /t REG_DWORD /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "MTMinWorkerThreads" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD" /v "FlipQueueSize" /t REG_BINARY /d "363400" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD" /v "Main3D" /t REG_BINARY /d "3634000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD" /v "Main3D_DEF" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD" /v "Main3D_NA" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD" /v "MTMaxWorkerThreads" /t REG_BINARY /d "363400" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD" /v "MTMinWorkerThreads" /t REG_BINARY /d "333200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "FlipQueueSize" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "Main3D" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "Main3D_DEF" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "Main3D_NA" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "MTMaxWorkerThreads" /t REG_DWORD /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "MTMinWorkerThreads" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD" /v "FlipQueueSize" /t REG_BINARY /d "363400" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD" /v "Main3D" /t REG_BINARY /d "3634000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD" /v "Main3D_DEF" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD" /v "Main3D_NA" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD" /v "MTMaxWorkerThreads" /t REG_BINARY /d "363400" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD" /v "MTMinWorkerThreads" /t REG_BINARY /d "333200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "FlipQueueSize" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "Main3D" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "Main3D_DEF" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "Main3D_NA" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "MTMaxWorkerThreads" /t REG_DWORD /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "MTMinWorkerThreads" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD" /v "FlipQueueSize" /t REG_BINARY /d "363400" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD" /v "Main3D" /t REG_BINARY /d "3634000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD" /v "Main3D_DEF" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD" /v "Main3D_NA" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD" /v "MTMaxWorkerThreads" /t REG_BINARY /d "363400" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD" /v "MTMinWorkerThreads" /t REG_BINARY /d "333200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "FlipQueueSize" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "Main3D" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "Main3D_DEF" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "Main3D_NA" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "MTMaxWorkerThreads" /t REG_DWORD /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "MTMinWorkerThreads" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD" /v "FlipQueueSize" /t REG_BINARY /d "363400" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD" /v "Main3D" /t REG_BINARY /d "3634000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD" /v "Main3D_DEF" /t REG_SZ /d "64" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD" /v "Main3D_NA" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD" /v "MTMaxWorkerThreads" /t REG_BINARY /d "363400" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD" /v "MTMinWorkerThreads" /t REG_BINARY /d "333200" /f
REM ; Full Screen Power Managment Disabled
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MSFTProxy\Enum" /v "Fullscreen Display Power Management" /t REG_SZ /d "Disabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_FullScreenPowerManagement" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_FullscreenDetectionSupport" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_FullscreenDetectionEtw" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "FULLSCREEN_DETECTION" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "FULLSCREEN_DETECTION_NA" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "FS_PWR_MGMT" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "FS_PWR_MGMT_NA" /t REG_SZ /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "FULLSCREEN_DETECTION" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "FULLSCREEN_DETECTION_NA" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "FS_PWR_MGMT" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "FS_PWR_MGMT_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "KMD_FullScreenPowerManagement" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "KMD_FullscreenDetectionSupport" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "KMD_FullscreenDetectionEtw" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "FULLSCREEN_DETECTION" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "FULLSCREEN_DETECTION_NA" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "FS_PWR_MGMT" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "FS_PWR_MGMT_NA" /t REG_SZ /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD" /v "FULLSCREEN_DETECTION" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD" /v "FULLSCREEN_DETECTION_NA" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD" /v "FS_PWR_MGMT" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD" /v "FS_PWR_MGMT_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "KMD_FullScreenPowerManagement" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "KMD_FullscreenDetectionSupport" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "KMD_FullscreenDetectionEtw" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "FULLSCREEN_DETECTION" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "FULLSCREEN_DETECTION_NA" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "FS_PWR_MGMT" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "FS_PWR_MGMT_NA" /t REG_SZ /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD" /v "FULLSCREEN_DETECTION" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD" /v "FULLSCREEN_DETECTION_NA" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD" /v "FS_PWR_MGMT" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD" /v "FS_PWR_MGMT_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "KMD_FullScreenPowerManagement" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "KMD_FullscreenDetectionSupport" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "KMD_FullscreenDetectionEtw" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "FULLSCREEN_DETECTION" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "FULLSCREEN_DETECTION_NA" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "FS_PWR_MGMT" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "FS_PWR_MGMT_NA" /t REG_SZ /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD" /v "FULLSCREEN_DETECTION" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD" /v "FULLSCREEN_DETECTION_NA" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD" /v "FS_PWR_MGMT" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD" /v "FS_PWR_MGMT_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_FullScreenPowerManagement" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_FullscreenDetectionSupport" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_FullscreenDetectionEtw" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "FULLSCREEN_DETECTION" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "FULLSCREEN_DETECTION_NA" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "FS_PWR_MGMT" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "FS_PWR_MGMT_NA" /t REG_SZ /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD" /v "FULLSCREEN_DETECTION" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD" /v "FULLSCREEN_DETECTION_NA" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD" /v "FS_PWR_MGMT" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD" /v "FS_PWR_MGMT_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_FullScreenPowerManagement" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_FullscreenDetectionSupport" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_FullscreenDetectionEtw" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "FULLSCREEN_DETECTION" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "FULLSCREEN_DETECTION_NA" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "FS_PWR_MGMT" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "FS_PWR_MGMT_NA" /t REG_SZ /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD" /v "FULLSCREEN_DETECTION" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD" /v "FULLSCREEN_DETECTION_NA" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD" /v "FS_PWR_MGMT" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD" /v "FS_PWR_MGMT_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_FullScreenPowerManagement" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_FullscreenDetectionSupport" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_FullscreenDetectionEtw" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "FULLSCREEN_DETECTION" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "FULLSCREEN_DETECTION_NA" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "FS_PWR_MGMT" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "FS_PWR_MGMT_NA" /t REG_SZ /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD" /v "FULLSCREEN_DETECTION" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD" /v "FULLSCREEN_DETECTION_NA" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD" /v "FS_PWR_MGMT" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD" /v "FS_PWR_MGMT_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_FullScreenPowerManagement" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_FullscreenDetectionSupport" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_FullscreenDetectionEtw" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "FULLSCREEN_DETECTION" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "FULLSCREEN_DETECTION_NA" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "FS_PWR_MGMT" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "FS_PWR_MGMT_NA" /t REG_SZ /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD" /v "FULLSCREEN_DETECTION" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD" /v "FULLSCREEN_DETECTION_NA" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD" /v "FS_PWR_MGMT" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD" /v "FS_PWR_MGMT_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_FullScreenPowerManagement" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_FullscreenDetectionSupport" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_FullscreenDetectionEtw" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "FULLSCREEN_DETECTION" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "FULLSCREEN_DETECTION_NA" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "FS_PWR_MGMT" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "FS_PWR_MGMT_NA" /t REG_SZ /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD" /v "FULLSCREEN_DETECTION" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD" /v "FULLSCREEN_DETECTION_NA" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD" /v "FS_PWR_MGMT" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD" /v "FS_PWR_MGMT_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_FullScreenPowerManagement" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_FullscreenDetectionSupport" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_FullscreenDetectionEtw" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "FULLSCREEN_DETECTION" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "FULLSCREEN_DETECTION_NA" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "FS_PWR_MGMT" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "FS_PWR_MGMT_NA" /t REG_SZ /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD" /v "FULLSCREEN_DETECTION" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD" /v "FULLSCREEN_DETECTION_NA" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD" /v "FS_PWR_MGMT" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD" /v "FS_PWR_MGMT_NA" /t REG_SZ /d "1" /f
REM ; Force V-Sync
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MSFTProxy\Enum" /v "Global V-Sync Configuration" /t REG_SZ /d "Force On" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "VSyncControl" /t REG_BINARY /d "3300" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "VSyncControl_DEF" /t REG_SZ /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD" /v "VSyncControl" /t REG_BINARY /d "3300" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD" /v "VSyncControl_DEF" /t REG_SZ /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD" /v "VSyncControl" /t REG_BINARY /d "3300" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD" /v "VSyncControl_DEF" /t REG_SZ /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD" /v "VSyncControl" /t REG_BINARY /d "3300" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD" /v "VSyncControl_DEF" /t REG_SZ /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD" /v "VSyncControl" /t REG_BINARY /d "3300" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD" /v "VSyncControl_DEF" /t REG_SZ /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD" /v "VSyncControl" /t REG_BINARY /d "3300" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD" /v "VSyncControl_DEF" /t REG_SZ /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD" /v "VSyncControl" /t REG_BINARY /d "3300" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD" /v "VSyncControl_DEF" /t REG_SZ /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD" /v "VSyncControl" /t REG_BINARY /d "3300" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD" /v "VSyncControl_DEF" /t REG_SZ /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD" /v "VSyncControl" /t REG_BINARY /d "3300" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD" /v "VSyncControl_DEF" /t REG_SZ /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD" /v "VSyncControl" /t REG_BINARY /d "3300" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD" /v "VSyncControl_DEF" /t REG_SZ /d "3" /f
REM ; FSAA Off
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MSFTProxy\Enum" /v "Fullscreen AA Configuration" /t REG_SZ /d "Disabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "FSAAPerfMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "FSAAPerfMode_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "FSAAPerfMode_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD" /v "FSAAPerfMode" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD" /v "FSAAPerfMode_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD" /v "FSAAPerfMode_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "FSAAPerfMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "FSAAPerfMode_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "FSAAPerfMode_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD" /v "FSAAPerfMode" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD" /v "FSAAPerfMode_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD" /v "FSAAPerfMode_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "FSAAPerfMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "FSAAPerfMode_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "FSAAPerfMode_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD" /v "FSAAPerfMode" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD" /v "FSAAPerfMode_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD" /v "FSAAPerfMode_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "FSAAPerfMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "FSAAPerfMode_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "FSAAPerfMode_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "FSAAPerfMode" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "FSAAPerfMode_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "FSAAPerfMode_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "FSAAPerfMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "FSAAPerfMode_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "FSAAPerfMode_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD" /v "FSAAPerfMode" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD" /v "FSAAPerfMode_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD" /v "FSAAPerfMode_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "FSAAPerfMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "FSAAPerfMode_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "FSAAPerfMode_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD" /v "FSAAPerfMode" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD" /v "FSAAPerfMode_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD" /v "FSAAPerfMode_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "FSAAPerfMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "FSAAPerfMode_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "FSAAPerfMode_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD" /v "FSAAPerfMode" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD" /v "FSAAPerfMode_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD" /v "FSAAPerfMode_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "FSAAPerfMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "FSAAPerfMode_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "FSAAPerfMode_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD" /v "FSAAPerfMode" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD" /v "FSAAPerfMode_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD" /v "FSAAPerfMode_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "FSAAPerfMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "FSAAPerfMode_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "FSAAPerfMode_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD" /v "FSAAPerfMode" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD" /v "FSAAPerfMode_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD" /v "FSAAPerfMode_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "FSAAPerfMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "FSAAPerfMode_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "FSAAPerfMode_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD" /v "FSAAPerfMode" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD" /v "FSAAPerfMode_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD" /v "FSAAPerfMode_NA" /t REG_SZ /d "1" /f
REM ; FBC Buffer to 32
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MSFTProxy\Enum" /v "GPU Framebuffer Compression Queue Buffer Size" /t REG_SZ /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "KMD_FBCBufferSize" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD" /v "KMD_FBCBufferSize" /t REG_BINARY /d "333200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "KMD_FBCBufferSize" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD" /v "KMD_FBCBufferSize" /t REG_BINARY /d "333200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "KMD_FBCBufferSize" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD" /v "KMD_FBCBufferSize" /t REG_BINARY /d "333200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_FBCBufferSize" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "KMD_FBCBufferSize" /t REG_BINARY /d "333200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_FBCBufferSize" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD" /v "KMD_FBCBufferSize" /t REG_BINARY /d "333200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_FBCBufferSize" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD" /v "KMD_FBCBufferSize" /t REG_BINARY /d "333200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_FBCBufferSize" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD" /v "KMD_FBCBufferSize" /t REG_BINARY /d "333200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_FBCBufferSize" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD" /v "KMD_FBCBufferSize" /t REG_BINARY /d "333200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_FBCBufferSize" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD" /v "KMD_FBCBufferSize" /t REG_BINARY /d "333200" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_FBCBufferSize" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD" /v "KMD_FBCBufferSize" /t REG_BINARY /d "333200" /f
REM ; remove amd dvr support
Reg.exe add "HKLM\SOFTWARE\AMD\DVR" /v "DvrEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\AMD\DVR" /v "DvrEnabled" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_DVRSupport" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_DVRSupport" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_DVRSupport" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_DVRSupport" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_DVRSupport" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_DVRSupport" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /f
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "AMDRadeonSoftware" /f
REM ; remove amd noice cancellation
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f
Reg.exe delete "HKCU\SOFTWARE\AMD\CN\Audio" /v "ANRToggleState" /f
Reg.exe add "HKCU\SOFTWARE\AMD\CN\Audio" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\EventLog\Application\AMD_ANR_BG_PROC" /f
Reg.exe delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "AMDNoiseSuppression" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "AMDNoiseSuppression" /f
REM ; Media Foundation
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f
Reg.exe add "HKCU\SOFTWARE\LAV\Video\HWAccel" /v "av1" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\LAV\Video\HWAccel" /v "dvd" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\LAV\Video\HWAccel" /v "h264" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\LAV\Video\HWAccel" /v "h264mvc" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\LAV\Video\HWAccel" /v "hevc" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\LAV\Video\HWAccel" /v "hevc10" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\LAV\Video\HWAccel" /v "mpeg2" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\LAV\Video\HWAccel" /v "mpeg4" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\LAV\Video\HWAccel" /v "vc1" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\LAV\Video\HWAccel" /v "vp9" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\LAV\Video\HWAccel" /v "AllowBaselineH264" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\LAV\Video\HWAccel" /v "HWAccel" /t REG_DWORD /d "4" /f
Reg.exe add "HKCU\SOFTWARE\LAV\Video\HWAccel" /v "HWResFlags" /t REG_DWORD /d "7" /f
Reg.exe add "HKCU\SOFTWARE\LAV\Video\Formats" /v "vc1" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\LAV\Video\HWAccel" /v "av1" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\LAV\Video\HWAccel" /v "dvd" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\LAV\Video\HWAccel" /v "h264" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\LAV\Video\HWAccel" /v "h264mvc" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\LAV\Video\HWAccel" /v "hevc" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\LAV\Video\HWAccel" /v "hevc10" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\LAV\Video\HWAccel" /v "mpeg2" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\LAV\Video\HWAccel" /v "mpeg4" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\LAV\Video\HWAccel" /v "vc1" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\LAV\Video\HWAccel" /v "vp9" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\LAV\Video\HWAccel" /v "AllowBaselineH264" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\LAV\Video\HWAccel" /v "HWAccel" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\LAV\Video\HWAccel" /v "HWResFlags" /t REG_DWORD /d "7" /f
REM ; disable stutter mode
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MSFTProxy\Enum" /v "Stutter Mode Override" /t REG_SZ /d "Disable" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "StutterMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_MCLKStutterModeThreshold" /t REG_DWORD /d "5000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "StutterMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "PP_MCLKStutterModeThreshold" /t REG_DWORD /d "5000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "StutterMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "PP_MCLKStutterModeThreshold" /t REG_DWORD /d "5000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "StutterMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "PP_MCLKStutterModeThreshold" /t REG_DWORD /d "5000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "StutterMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "PP_MCLKStutterModeThreshold" /t REG_DWORD /d "5000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "StutterMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "PP_MCLKStutterModeThreshold" /t REG_DWORD /d "5000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "StutterMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "PP_MCLKStutterModeThreshold" /t REG_DWORD /d "5000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "StutterMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "PP_MCLKStutterModeThreshold" /t REG_DWORD /d "5000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "StutterMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "PP_MCLKStutterModeThreshold" /t REG_DWORD /d "5000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "StutterMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "PP_MCLKStutterModeThreshold" /t REG_DWORD /d "5000" /f
REM ; TAA Disable
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MSFTProxy\Enum" /v "Temporal AA Configuration" /t REG_SZ /d "Disabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "TemporalAAMultiplier" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "TemporalAAMultiplier_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "TemporalAAMultiplier_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "TemporalAAMultiplier" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "TemporalAAMultiplier_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "TemporalAAMultiplier_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "TemporalAAMultiplier" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "TemporalAAMultiplier_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "TemporalAAMultiplier_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD" /v "TemporalAAMultiplier" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD" /v "TemporalAAMultiplier_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD" /v "TemporalAAMultiplier_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "TemporalAAMultiplier" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "TemporalAAMultiplier_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "TemporalAAMultiplier_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD" /v "TemporalAAMultiplier" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD" /v "TemporalAAMultiplier_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD" /v "TemporalAAMultiplier_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "TemporalAAMultiplier" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "TemporalAAMultiplier_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "TemporalAAMultiplier_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD" /v "TemporalAAMultiplier" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD" /v "TemporalAAMultiplier_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD" /v "TemporalAAMultiplier_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "TemporalAAMultiplier" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "TemporalAAMultiplier_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "TemporalAAMultiplier_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD" /v "TemporalAAMultiplier" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD" /v "TemporalAAMultiplier_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD" /v "TemporalAAMultiplier_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "TemporalAAMultiplier" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "TemporalAAMultiplier_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "TemporalAAMultiplier_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD" /v "TemporalAAMultiplier" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD" /v "TemporalAAMultiplier_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD" /v "TemporalAAMultiplier_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "TemporalAAMultiplier" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "TemporalAAMultiplier_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "TemporalAAMultiplier_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD" /v "TemporalAAMultiplier" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD" /v "TemporalAAMultiplier_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD" /v "TemporalAAMultiplier_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "TemporalAAMultiplier" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "TemporalAAMultiplier_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "TemporalAAMultiplier_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD" /v "TemporalAAMultiplier" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD" /v "TemporalAAMultiplier_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD" /v "TemporalAAMultiplier_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "TemporalAAMultiplier" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "TemporalAAMultiplier_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "TemporalAAMultiplier_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD" /v "TemporalAAMultiplier" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD" /v "TemporalAAMultiplier_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD" /v "TemporalAAMultiplier_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "TemporalAAMultiplier" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "TemporalAAMultiplier_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "TemporalAAMultiplier_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD" /v "TemporalAAMultiplier" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD" /v "TemporalAAMultiplier_DEF" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD" /v "TemporalAAMultiplier_NA" /t REG_SZ /d "1" /f
REM ; RSR Disable
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MSFTProxy\Enum" /v "Radeon Software Super Resolution Service Mode" /t REG_SZ /d "Disabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RADEON_UPSCALING" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RADEON_UPSCALING_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_RadeonUpscalingEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_RadeonUpscalingSupport" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "RADEON_UPSCALING" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "RADEON_UPSCALING_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "RADEON_UPSCALING" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "RADEON_UPSCALING_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "KMD_RadeonUpscalingEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "KMD_RadeonUpscalingSupport" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD" /v "RADEON_UPSCALING" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD" /v "RADEON_UPSCALING_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "RADEON_UPSCALING" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "RADEON_UPSCALING_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "KMD_RadeonUpscalingEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "KMD_RadeonUpscalingSupport" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD" /v "RADEON_UPSCALING" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD" /v "RADEON_UPSCALING_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "RADEON_UPSCALING" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "RADEON_UPSCALING_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "KMD_RadeonUpscalingEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "KMD_RadeonUpscalingSupport" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD" /v "RADEON_UPSCALING" /t REG_BINARY /d "3000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD" /v "RADEON_UPSCALING_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "RADEON_UPSCALING" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "RADEON_UPSCALING_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_RadeonUpscalingEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_RadeonUpscalingSupport" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD" /v "RADEON_UPSCALING" /t REG_BINARY /d "3100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD" /v "RADEON_UPSCALING_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "RADEON_UPSCALING" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "RADEON_UPSCALING_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_RadeonUpscalingEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_RadeonUpscalingSupport" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD" /v "RADEON_UPSCALING" /t REG_BINARY /d "3100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD" /v "RADEON_UPSCALING_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "RADEON_UPSCALING" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "RADEON_UPSCALING_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_RadeonUpscalingEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_RadeonUpscalingSupport" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD" /v "RADEON_UPSCALING" /t REG_BINARY /d "3100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD" /v "RADEON_UPSCALING_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "RADEON_UPSCALING" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "RADEON_UPSCALING_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_RadeonUpscalingEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_RadeonUpscalingSupport" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD" /v "RADEON_UPSCALING" /t REG_BINARY /d "3100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD" /v "RADEON_UPSCALING_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "RADEON_UPSCALING" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "RADEON_UPSCALING_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_RadeonUpscalingEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_RadeonUpscalingSupport" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD" /v "RADEON_UPSCALING" /t REG_BINARY /d "3100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD" /v "RADEON_UPSCALING_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "RADEON_UPSCALING" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "RADEON_UPSCALING_NA" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_RadeonUpscalingEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_RadeonUpscalingSupport" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD" /v "RADEON_UPSCALING" /t REG_BINARY /d "3100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD" /v "RADEON_UPSCALING_NA" /t REG_SZ /d "1" /f
REM ; GPU High Performance
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MSFTProxy\Enum" /v "GPU P-State Management Configuration" /t REG_SZ /d "Overdrive" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableAspmL0s" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableAspmL1" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableAspmL0s" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableAspmL1" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_UseBestGPUPowerOption" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_DisableAutoWattman" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_Force3DPerformanceMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_ForceHighDPMLevel" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_ForceHighUVDState" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_ForceMCLKHigh" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_ForceSCLKHigh" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "DisableAspmL0s" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "DisableAspmL1" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "EnableAspmL0s" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "EnableAspmL1" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "KMD_UseBestGPUPowerOption" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "PP_DisableAutoWattman" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "PP_Force3DPerformanceMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "PP_ForceHighDPMLevel" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "PP_ForceHighUVDState" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "PP_ForceMCLKHigh" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "PP_ForceSCLKHigh" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "DisableAspmL0s" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "DisableAspmL1" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "EnableAspmL0s" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "EnableAspmL1" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "KMD_UseBestGPUPowerOption" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "PP_DisableAutoWattman" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "PP_Force3DPerformanceMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "PP_ForceHighDPMLevel" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "PP_ForceHighUVDState" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "PP_ForceMCLKHigh" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "PP_ForceSCLKHigh" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "DisableAspmL0s" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "DisableAspmL1" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "EnableAspmL0s" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "EnableAspmL1" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "KMD_UseBestGPUPowerOption" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "PP_DisableAutoWattman" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "PP_Force3DPerformanceMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "PP_ForceHighDPMLevel" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "PP_ForceHighUVDState" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "PP_ForceMCLKHigh" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "PP_ForceSCLKHigh" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "DisableAspmL0s" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "DisableAspmL1" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "EnableAspmL0s" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "EnableAspmL1" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_UseBestGPUPowerOption" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "PP_DisableAutoWattman" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "PP_Force3DPerformanceMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "PP_ForceHighDPMLevel" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "PP_ForceHighUVDState" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "PP_ForceMCLKHigh" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "PP_ForceSCLKHigh" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "DisableAspmL0s" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "DisableAspmL1" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "EnableAspmL0s" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "EnableAspmL1" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_UseBestGPUPowerOption" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "PP_DisableAutoWattman" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "PP_Force3DPerformanceMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "PP_ForceHighDPMLevel" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "PP_ForceHighUVDState" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "PP_ForceMCLKHigh" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "PP_ForceSCLKHigh" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "DisableAspmL0s" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "DisableAspmL1" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "EnableAspmL0s" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "EnableAspmL1" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_UseBestGPUPowerOption" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "PP_DisableAutoWattman" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "PP_Force3DPerformanceMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "PP_ForceHighDPMLevel" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "PP_ForceHighUVDState" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "PP_ForceMCLKHigh" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "PP_ForceSCLKHigh" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "DisableAspmL0s" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "DisableAspmL1" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "EnableAspmL0s" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "EnableAspmL1" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_UseBestGPUPowerOption" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "PP_DisableAutoWattman" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "PP_Force3DPerformanceMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "PP_ForceHighDPMLevel" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "PP_ForceHighUVDState" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "PP_ForceMCLKHigh" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "PP_ForceSCLKHigh" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "DisableAspmL0s" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "DisableAspmL1" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "EnableAspmL0s" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "EnableAspmL1" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_UseBestGPUPowerOption" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "PP_DisableAutoWattman" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "PP_Force3DPerformanceMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "PP_ForceHighDPMLevel" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "PP_ForceHighUVDState" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "PP_ForceMCLKHigh" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "PP_ForceSCLKHigh" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "DisableAspmL0s" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "DisableAspmL1" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "EnableAspmL0s" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "EnableAspmL1" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_UseBestGPUPowerOption" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "PP_DisableAutoWattman" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "PP_Force3DPerformanceMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "PP_ForceHighDPMLevel" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "PP_ForceHighUVDState" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "PP_ForceMCLKHigh" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "PP_ForceSCLKHigh" /t REG_DWORD /d "1" /f
REM ; Disable OS GPU Power Management
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MSFTProxy\Enum" /v "Operating System GPU Power Behavior" /t REG_SZ /d "Disabled" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_OSControlsGPUPower" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "KMD_OSControlsGPUPower" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "KMD_OSControlsGPUPower" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "KMD_OSControlsGPUPower" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_OSControlsGPUPower" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_OSControlsGPUPower" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_OSControlsGPUPower" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_OSControlsGPUPower" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_OSControlsGPUPower" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_OSControlsGPUPower" /f
REM ; DirectPlay Accerelation
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MSFTProxy\Enum" /v "DirectPlay HW Cursor Acceleration Mode" /t REG_SZ /d "Disabled" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_EnableHWCursor" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "KMD_EnableHWCursor" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "KMD_EnableHWCursor" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "KMD_EnableHWCursor" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_EnableHWCursor" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_EnableHWCursor" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_EnableHWCursor" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_EnableHWCursor" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_EnableHWCursor" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_EnableHWCursor" /f
REM ; GPU Scheduler
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MSFTProxy\Enum" /v "Radeon HSA Compute Policy" /t REG_SZ /d "Enabled Sch" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_EnableHsa" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_EnableHsaHws" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_EnableHsaSignal" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "KMD_EnableHsa" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "KMD_EnableHsaHws" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "KMD_EnableHsaSignal" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "KMD_EnableHsa" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "KMD_EnableHsaHws" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "KMD_EnableHsaSignal" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "KMD_EnableHsa" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "KMD_EnableHsaHws" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "KMD_EnableHsaSignal" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_EnableHsa" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_EnableHsaHws" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "KMD_EnableHsaSignal" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_EnableHsa" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_EnableHsaHws" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "KMD_EnableHsaSignal" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_EnableHsa" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_EnableHsaHws" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "KMD_EnableHsaSignal" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_EnableHsa" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_EnableHsaHws" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "KMD_EnableHsaSignal" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_EnableHsa" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_EnableHsaHws" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "KMD_EnableHsaSignal" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_EnableHsa" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_EnableHsaHws" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "KMD_EnableHsaSignal" /f
REM ; GPU Wave Size 64
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MSFTProxy\Enum" /v "GPU Wave Size" /t REG_SZ /d "64" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD" /v "ForceWaveSize64" /t REG_BINARY /d "3100" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD\DXX" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD\DXX" /v "ForceWaveSize64" /t REG_SZ /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD\DXC" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD\DXC" /v "ForceWaveSize64" /t REG_SZ /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\OpenGL\Private" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\OpenGL\Private" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD" /v "ForceWaveSize64" /t REG_BINARY /d "3100" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD\DXX" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD\DXX" /v "ForceWaveSize64" /t REG_SZ /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD\DXC" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD\DXC" /v "ForceWaveSize64" /t REG_SZ /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\OpenGL\Private" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\OpenGL\Private" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD" /v "ForceWaveSize64" /t REG_BINARY /d "3100" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD\DXX" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD\DXX" /v "ForceWaveSize64" /t REG_SZ /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD\DXC" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD\DXC" /v "ForceWaveSize64" /t REG_SZ /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\OpenGL\Private" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\OpenGL\Private" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "ForceWaveSize64" /t REG_BINARY /d "3100" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXX" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXX" /v "ForceWaveSize64" /t REG_SZ /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXC" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXC" /v "ForceWaveSize64" /t REG_SZ /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\OpenGL\Private" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\OpenGL\Private" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD" /v "ForceWaveSize64" /t REG_BINARY /d "3100" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD\DXX" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD\DXX" /v "ForceWaveSize64" /t REG_SZ /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD\DXC" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD\DXC" /v "ForceWaveSize64" /t REG_SZ /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\Device0\OpenGL\Private" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\Device0\OpenGL\Private" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\Device1\OpenGL\Private" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\Device1\OpenGL\Private" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\Device2\OpenGL\Private" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\Device2\OpenGL\Private" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\Device3\OpenGL\Private" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\Device3\OpenGL\Private" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD" /v "ForceWaveSize64" /t REG_BINARY /d "3100" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD\DXX" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD\DXX" /v "ForceWaveSize64" /t REG_SZ /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD\DXC" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD\DXC" /v "ForceWaveSize64" /t REG_SZ /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\Device0\OpenGL\Private" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\Device0\OpenGL\Private" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\Device1\OpenGL\Private" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\Device1\OpenGL\Private" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\Device2\OpenGL\Private" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\Device2\OpenGL\Private" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\Device3\OpenGL\Private" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\Device3\OpenGL\Private" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD" /v "ForceWaveSize64" /t REG_BINARY /d "3100" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD\DXX" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD\DXX" /v "ForceWaveSize64" /t REG_SZ /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD\DXC" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD\DXC" /v "ForceWaveSize64" /t REG_SZ /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\Device0\OpenGL\Private" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\Device0\OpenGL\Private" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\Device1\OpenGL\Private" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\Device1\OpenGL\Private" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\Device2\OpenGL\Private" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\Device2\OpenGL\Private" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\Device3\OpenGL\Private" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\Device3\OpenGL\Private" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD" /v "ForceWaveSize64" /t REG_BINARY /d "3100" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD\DXX" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD\DXX" /v "ForceWaveSize64" /t REG_SZ /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD\DXC" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD\DXC" /v "ForceWaveSize64" /t REG_SZ /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\Device0\OpenGL\Private" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\Device0\OpenGL\Private" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\Device1\OpenGL\Private" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\Device1\OpenGL\Private" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\Device2\OpenGL\Private" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\Device2\OpenGL\Private" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\Device3\OpenGL\Private" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\Device3\OpenGL\Private" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD" /v "ForceWaveSize64" /t REG_BINARY /d "3100" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD\DXX" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD\DXX" /v "ForceWaveSize64" /t REG_SZ /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD\DXC" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD\DXC" /v "ForceWaveSize64" /t REG_SZ /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\Device0\OpenGL\Private" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\Device0\OpenGL\Private" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\Device1\OpenGL\Private" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\Device1\OpenGL\Private" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\Device2\OpenGL\Private" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\Device2\OpenGL\Private" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\Device3\OpenGL\Private" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\Device3\OpenGL\Private" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD" /v "ForceWaveSize64" /t REG_BINARY /d "3100" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD\DXX" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD\DXX" /v "ForceWaveSize64" /t REG_SZ /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD\DXC" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD\DXC" /v "ForceWaveSize64" /t REG_SZ /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\Device0\OpenGL\Private" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\Device0\OpenGL\Private" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\Device1\OpenGL\Private" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\Device1\OpenGL\Private" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\Device2\OpenGL\Private" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\Device2\OpenGL\Private" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\Device3\OpenGL\Private" /v "ForceWaveSize32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\Device3\OpenGL\Private" /v "ForceWaveSize64" /t REG_DWORD /d "1" /f
REM ; CPU Affinity Optimization for GPU
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MSFTProxy\Enum" /v "CPU Affinity Optimization" /t REG_SZ /d "Enabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD" /v "CpuAffinityOptimization" /t REG_BINARY /d "3100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD\DXX" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\UMD\DXC" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD" /v "CpuAffinityOptimization" /t REG_BINARY /d "3100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD\DXX" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\UMD\DXC" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD" /v "CpuAffinityOptimization" /t REG_BINARY /d "3100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD\DXX" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\UMD\DXC" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "CpuAffinityOptimization" /t REG_BINARY /d "3100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXX" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXC" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD" /v "CpuAffinityOptimization" /t REG_BINARY /d "3100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD\DXX" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\UMD\DXC" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\Device0\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\Device1\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\Device2\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag\Device3\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD" /v "CpuAffinityOptimization" /t REG_BINARY /d "3100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD\DXX" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\UMD\DXC" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\Device0\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\Device1\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\Device2\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdap\Device3\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD" /v "CpuAffinityOptimization" /t REG_BINARY /d "3100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD\DXX" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\UMD\DXC" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\Device0\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\Device1\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\Device2\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmpfd\Device3\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD" /v "CpuAffinityOptimization" /t REG_BINARY /d "3100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD\DXX" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\UMD\DXC" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\Device0\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\Device1\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\Device2\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdwddmg\Device3\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD" /v "CpuAffinityOptimization" /t REG_BINARY /d "3100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD\DXX" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\UMD\DXC" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\Device0\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\Device1\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\Device2\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdgpuv\Device3\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD" /v "CpuAffinityOptimization" /t REG_BINARY /d "3100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD\DXX" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\UMD\DXC" /v "CpuAffinityOptimization" /t REG_SZ /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\Device0\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\Device1\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\Device2\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\atikmdag\Device3\OpenGL\Private" /v "CpuAffinityOptimization" /t REG_DWORD /d "1" /f
REM ; Latency Optimization
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "LTRSnoopL1Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "LTRSnoopL0Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "LTRNoSnoopL1Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "LTRMaxNoSnoopLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_RpmComputeLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DalUrgentLatencyNs" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "memClockSwitchLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_RTPMComputeF1Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_DGBMMMaxTransitionLatencyUvd" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_DGBPMMaxTransitionLatencyGfx" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DalNBLatencyForUnderFlow" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DalDramClockChangeLatencyNs" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "BGM_LTRSnoopL1Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "BGM_LTRSnoopL0Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "BGM_LTRNoSnoopL1Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "BGM_LTRNoSnoopL0Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "BGM_LTRMaxSnoopLatencyValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "BGM_LTRMaxNoSnoopLatencyValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "LTRSnoopL1Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "LTRSnoopL0Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "LTRNoSnoopL1Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "LTRMaxNoSnoopLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "KMD_RpmComputeLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "DalUrgentLatencyNs" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "memClockSwitchLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "PP_RTPMComputeF1Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "PP_DGBMMMaxTransitionLatencyUvd" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "PP_DGBPMMaxTransitionLatencyGfx" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "DalNBLatencyForUnderFlow" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "DalDramClockChangeLatencyNs" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "BGM_LTRSnoopL1Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "BGM_LTRSnoopL0Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "BGM_LTRNoSnoopL1Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "BGM_LTRNoSnoopL0Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "BGM_LTRMaxSnoopLatencyValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "BGM_LTRMaxNoSnoopLatencyValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "LTRSnoopL1Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "LTRSnoopL0Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "LTRNoSnoopL1Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "LTRMaxNoSnoopLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "KMD_RpmComputeLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "DalUrgentLatencyNs" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "memClockSwitchLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "PP_RTPMComputeF1Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "PP_DGBMMMaxTransitionLatencyUvd" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "PP_DGBPMMaxTransitionLatencyGfx" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "DalNBLatencyForUnderFlow" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "DalDramClockChangeLatencyNs" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "BGM_LTRSnoopL1Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "BGM_LTRSnoopL0Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "BGM_LTRNoSnoopL1Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "BGM_LTRNoSnoopL0Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "BGM_LTRMaxSnoopLatencyValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "BGM_LTRMaxNoSnoopLatencyValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "LTRSnoopL1Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "LTRSnoopL0Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "LTRNoSnoopL1Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "LTRMaxNoSnoopLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "KMD_RpmComputeLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "DalUrgentLatencyNs" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "memClockSwitchLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "PP_RTPMComputeF1Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "PP_DGBMMMaxTransitionLatencyUvd" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "PP_DGBPMMaxTransitionLatencyGfx" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "DalNBLatencyForUnderFlow" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "DalDramClockChangeLatencyNs" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "BGM_LTRSnoopL1Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "BGM_LTRSnoopL0Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "BGM_LTRNoSnoopL1Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "BGM_LTRNoSnoopL0Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "BGM_LTRMaxSnoopLatencyValue" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "BGM_LTRMaxNoSnoopLatencyValue" /t REG_DWORD /d "1" /f
:: Enable MSI Mode for GPU
echo Enabling MSI Mode
for /f %%g in ('wmic path win32_videocontroller get PNPDeviceID ^| findstr /L "VEN_"') do (
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f >> APB_Log.txt              )
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /t REG_DWORD /d "0" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Disable Override Referesh Rate
echo Disabling Display Refresh Rate Override
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "3D_Refresh_Rate_Override_DEF" /t REG_DWORD /d "0" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Disable SnapShot
echo Disabling SnapShot
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AllowSnapshot" /t REG_DWORD /d "0" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Disable Anti Aliasing
echo Disabling Anti Aliasing
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AAF_NA" /t REG_DWORD /d "0" /f >> APB_Log.txt
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AntiAlias_NA" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "ASTT_NA" /t REG_SZ /d "0" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Disable AllowSubscription
echo Disabling Subscriptions
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AllowSubscription" /t REG_DWORD /d "0" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Disable Anisotropic Filtering
echo Disabling Anisotropic Filtering
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AreaAniso_NA" /t REG_SZ /d "0" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Disable AllowRSOverlay
echo Disabling Radeon Overlay
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AllowRSOverlay" /t REG_SZ /d "false" /f >> APB_Log.txt 
timeout /t 1 /nobreak > NUL

:: Enable Adaptive DeInterlacing
echo Enabling Adaptive DeInterlacing
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "Adaptive De-interlacing" /t REG_DWORD /d "1" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Disable AllowSkins
echo Disabling Skins
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AllowSkins" /t REG_SZ /d "false" /f >> APB_Log.txt 
timeout /t 1 /nobreak > NUL

:: Disable AutoColorDepthReduction_NA
echo Disabling Automatic Color Depth Reduction
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AutoColorDepthReduction_NA" /t REG_DWORD /d "0" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Disable Power Gating
echo Disabling Power Gating
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableSAMUPowerGating" /t REG_DWORD /d "1" /f >> APB_Log.txt
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableUVDPowerGatingDynamic" /t REG_DWORD /d "1" /f >> APB_Log.txt
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableVCEPowerGating" /t REG_DWORD /d "1" /f >> APB_Log.txt
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisablePowerGating" /t REG_DWORD /d "1" /f >> APB_Log.txt
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDrmdmaPowerGating" /t REG_DWORD /d "1" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Disable Clock Gating
echo Disabling Clock Gating
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableVceSwClockGating" /t REG_DWORD /d "1" /f >> APB_Log.txt
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUvdClockGating" /t REG_DWORD /d "1" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Disable ASPM
echo Disabling Active State Power Management
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableAspmL0s" /t REG_DWORD /d "0" /f >> APB_Log.txt
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableAspmL1" /t REG_DWORD /d "0" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Disable ULPS
echo Disabling Ultra Low Power States
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUlps" /t REG_DWORD /d "0" /f >> APB_Log.txt
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUlps_NA" /t REG_SZ /d "0" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Enable De-Lag
echo Enabling De-Lag
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_DeLagEnabled" /t REG_DWORD /d "1" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Disable FRT
echo Disabling Frame Rate Target
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_FRTEnabled" /t REG_DWORD /d "0" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Disable DMA
echo Disabling DMA
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDMACopy" /t REG_DWORD /d "1" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Enable BlockWrite
echo Enable BlockWrite
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableBlockWrite" /t REG_DWORD /d "0" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Disable StutterMode
echo Disabling Stutter Mode
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "StutterMode" /t REG_DWORD /d "0" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Disable GPU Mem Clock Sleep State
echo Disabling GPU Memory Clock Sleep State
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "1" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Disable Thermal Throttling
echo Disabling Thermal Throttling
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_ThermalAutoThrottlingEnable" /t REG_DWORD /d "0" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Disable Preemption
echo Disabling Preemption
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_EnableComputePreemption" /t REG_DWORD /d "0" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Setting Main3D
echo Setting Main3D
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Main3D_DEF" /t REG_SZ /d "1" /f >> APB_Log.txt
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Main3D" /t REG_BINARY /d "3100" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Setting FlipQueueSize
echo Setting FlipQueueSize
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "FlipQueueSize" /t REG_BINARY /d "3100" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Setting Shader Cache
echo Setting Shader Cache Size
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "ShaderCache" /t REG_BINARY /d "3200" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Configuring TFQ
echo Configuring TFQ
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "TFQ" /t REG_BINARY /d "3200" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Disable HDCP
echo Disabling High-Bandwidth Digital Content ProtectionF
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\\DAL2_DATA__2_0\DisplayPath_4\EDID_D109_78E9\Option" /v "ProtectionControl" /t REG_BINARY /d "0100000001000000" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Disable GPU Power Down
echo Disabling GPU Power Down
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_GPUPowerDownEnabled" /t REG_DWORD /d "1" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Disable AMD Logging
echo Disabling AMD Logging
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdlog" /v "Start" /t REG_DWORD /d "4" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: AMD Tweaks (Melody The Neko#9870)
echo Applying Melody AMD Tweaks
for %%a in (LTRSnoopL1Latency LTRSnoopL0Latency LTRNoSnoopL1Latency LTRMaxNoSnoopLatency KMD_RpmComputeLatency
        DalUrgentLatencyNs memClockSwitchLatency PP_RTPMComputeF1Latency PP_DGBMMMaxTransitionLatencyUvd
        PP_DGBPMMaxTransitionLatencyGfx DalNBLatencyForUnderFlow DalDramClockChangeLatencyNs
        BGM_LTRSnoopL1Latency BGM_LTRSnoopL0Latency BGM_LTRNoSnoopL1Latency BGM_LTRNoSnoopL0Latency
        BGM_LTRMaxSnoopLatencyValue BGM_LTRMaxNoSnoopLatencyValue) do (reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "%%a" /t REG_DWORD /d "1" /f >> APB_Log.txt
)
Reg.exe add "HKCU\Software\AMD\CN" /v "AutoUpdateTriggered" /t REG_DWORD /d "0" /f > nul 2>&1 > nul 2>&1
Reg.exe add "HKCU\Software\AMD\CN" /v "PowerSaverAutoEnable_CUR" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\CN" /v "WindowSize" /t REG_SZ /d "1440,960" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\CN" /v "BuildType" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\CN" /v "WizardProfile" /t REG_SZ /d "PROFILE_CUSTOM" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\CN" /v "UserTypeWizardShown" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\CN" /v "LastPage" /t REG_SZ /d "settings/graphics/0/" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\CN" /v "AutoUpdate" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\CN" /v "RSXBrowserUnavailable" /t REG_SZ /d "true" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\CN" /v "SystemTray" /t REG_SZ /d "false" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\CN" /v "AllowWebContent" /t REG_SZ /d "false" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\CN" /v "CN_Hide_Toast_Notification" /t REG_SZ /d "true" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\CN" /v "AnimationEffect" /t REG_SZ /d "false" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\CN\OverlayNotification" /v "AlreadyNotified" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\CN\VirtualSuperResolution" /v "AlreadyNotified" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\DVR" /v "PerformanceMonitorOpacityWA" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\DVR" /v "CaptureFileOutput" /t REG_SZ /d "C:\Users\Emre\Videos\Radeon ReLive" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\DVR" /v "DvrEnabled" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\DVR" /v "ActiveSceneId" /t REG_SZ /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\DVR" /v "AVCCaps" /t REG_SZ /d "256,1,4096,4096,100000000,244800,0;" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\DVR" /v "HEVCCaps" /t REG_SZ /d "256,1,4096,4096,2147483647,979200,0;" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\DVR" /v "AvcEfcSupport" /t REG_SZ /d "0;" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\DVR" /v "HevcEfcSupport" /t REG_SZ /d "0;" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\DVR" /v "PrevInstantReplayEnable" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\DVR" /v "PrevInGameReplayEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\DVR" /v "PrevInstantGifEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\DVR" /v "DvrDesktops" /t REG_SZ /d "\\.\DISPLAY19" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\DVR" /v "RemoteServerStatus" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\DVR" /v "ShowRSOverlay" /t REG_SZ /d "false" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\SCENE\0" /v "CameraSize" /t REG_DWORD /d "3" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\SCENE\0" /v "CameraEnabled" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\SCENE\0" /v "CameraOpacity" /t REG_DWORD /d "100" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\SCENE\0" /v "CameraAnchor" /t REG_DWORD /d "3" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\SCENE\0" /v "CameraShownOnScreen" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\SCENE\0" /v "IndicatorPosition" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\SCENE\0" /v "TimerEnabled" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\SCENE\0" /v "ChatOverlayEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\SCENE\0" /v "ChatCustomOffset" /t REG_SZ /d "0.0260,0.0462" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\SCENE\0" /v "ChatOverlayAnchor" /t REG_DWORD /d "4" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\SCENE\0" /v "ChatBackgroundBlur" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\SCENE\0" /v "ChatFontSize" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\SCENE\0" /v "RelativeCoords" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\SCENE\0" /v "CameraOffset" /t REG_SZ /d "0.0208,0.0370" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\SCENE\0" /v "CameraCustomOffset" /t REG_SZ /d "0.0208,0.0370" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\SCENE\0" /v "CameraRect" /t REG_SZ /d "0.1667,0.2222" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\SCENE\0" /v "CameraCustomRect" /t REG_SZ /d "0.1667,0.2222" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\SCENE\0" /v "ChatCustomRect" /t REG_SZ /d "0.1562,0.1562" /f > nul 2>&1
Reg.exe add "HKCU\Software\AMD\SCENE\0" /v "ChatOverlaySize" /t REG_DWORD /d "3" /f > nul 2>&1
Reg.exe add "HKCU\Software\ATI\ACE\Settings\ADL\AppProfiles" /v "AplReloadCounter" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\Software\AMD\Install" /v "AUEP" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\Software\AUEP" /v "RSX_AUEPStatus" /t REG_DWORD /d "2" /f > nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DalOptimizeEdpLinkRate" /t reg_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DalPSRFeatureEnable" /t reg_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableAspmL0s" /t reg_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableAspmL1" /t reg_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisablePllOffInL1" /t reg_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableSamuClockGating" /t reg_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableSamuLightSleep" /t reg_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableGPUVirtualizationFeature" /t reg_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_BlockchainSupport" /t reg_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_ChillEnabled" /t reg_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_EnableGDIAcceleration" /t reg_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_DisableAutoWattman" /t reg_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_DisableLightSleep" /t reg_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_ThermalAutoThrottlingEnable" /t reg_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "3D_Refresh_Rate_Override_DEF" /t reg_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "3to2Pulldown_NA" /t reg_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AAF_NA" /t reg_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "Adaptive De-interlacing" /t reg_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AllowRSOverlay" /t reg_SZ /d "false" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AllowSkins" /t reg_SZ /d "false" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AllowSnapshot" /t reg_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AllowSubscription" /t reg_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AntiAlias_NA" /t reg_SZ /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AreaAniso_NA" /t reg_SZ /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "ASTT_NA" /t reg_SZ /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AutoColorDepthReduction_NA" /t reg_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableSAMUPowerGating" /t reg_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableUVDPowerGatingDynamic" /t reg_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableVCEPowerGating" /t reg_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableAspmL0s" /t reg_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableAspmL1" /t reg_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUlps" /t reg_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUlps_NA" /t reg_SZ /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_DeLagEnabled" /t reg_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_FRTEnabled" /t reg_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDrmdmaPowerGating" /t reg_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "NotifySubscription" /t REG_BINARY /d "3000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "IsComponentControl" /t REG_BINARY /d "00000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_USUEnable" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_RadeonBoostEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "IsAutoDefault" /t REG_BINARY /d "01000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_ChillEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_DeLagEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "ACE" /t REG_BINARY /d "3000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "AnisoDegree_SET" /t REG_BINARY /d "3020322034203820313600" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Main3D_SET" /t REG_BINARY /d "302031203220332034203500" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Tessellation_OPTION" /t REG_BINARY /d "3200" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Tessellation" /t REG_BINARY /d "3100" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "AAF" /t REG_BINARY /d "30000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "GI" /t REG_BINARY /d "31000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "CatalystAI" /t REG_BINARY /d "31000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "TemporalAAMultiplier_NA" /t REG_BINARY /d "3100" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "ForceZBufferDepth" /t REG_BINARY /d "30000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "EnableTripleBuffering" /t REG_BINARY /d "3000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "ExportCompressedTex" /t REG_BINARY /d "31000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "PixelCenter" /t REG_BINARY /d "30000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "ZFormats_NA" /t REG_BINARY /d "3100" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "DitherAlpha_NA" /t REG_BINARY /d "3100" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "SwapEffect_D3D_SET" /t REG_BINARY /d "3020312032203320342038203900" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "TFQ" /t REG_BINARY /d "3200" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "VSyncControl" /t REG_BINARY /d "3100" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "TextureOpt" /t REG_BINARY /d "30000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "TextureLod" /t REG_BINARY /d "30000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "ASE" /t REG_BINARY /d "3000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "ASD" /t REG_BINARY /d "3000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "ASTT" /t REG_BINARY /d "3000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "AntiAliasSamples" /t REG_BINARY /d "3000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "AntiAlias" /t REG_BINARY /d "3100" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "AnisoDegree" /t REG_BINARY /d "3000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "AnisoType" /t REG_BINARY /d "30000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "AntiAliasMapping_SET" /t REG_BINARY /d "3028303A302C313A3029203228303A322C313A3229203428303A342C313A3429203828303A382C313A382900" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "AntiAliasSamples_SET" /t REG_BINARY /d "3020322034203800" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "ForceZBufferDepth_SET" /t REG_BINARY /d "3020313620323400" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "SwapEffect_OGL_SET" /t REG_BINARY /d "3020312032203320342035203620372038203920313120313220313320313420313520313620313700" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Tessellation_SET" /t REG_BINARY /d "31203220342036203820313620333220363400" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "HighQualityAF" /t REG_BINARY /d "3100" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "DisplayCrossfireLogo" /t REG_BINARY /d "3000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "AppGpuId" /t REG_BINARY /d "300078003000310030003000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "SwapEffect" /t REG_BINARY /d "30000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "PowerState" /t REG_BINARY /d "3000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "AntiStuttering" /t REG_BINARY /d "3100" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "TurboSync" /t REG_BINARY /d "3000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "SurfaceFormatReplacements" /t REG_BINARY /d "3100" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "EQAA" /t REG_BINARY /d "3000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "ShaderCache" /t REG_BINARY /d "3100" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "MLF" /t REG_BINARY /d "3000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "TruformMode_NA" /t REG_BINARY /d "3100" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXVA" /v "LRTCEnable" /t REG_BINARY /d "30000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXVA" /v "3to2Pulldown" /t REG_BINARY /d "31000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXVA" /v "MosquitoNoiseRemoval_ENABLE" /t REG_BINARY /d "30000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXVA" /v "MosquitoNoiseRemoval" /t REG_BINARY /d "350030000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXVA" /v "Deblocking_ENABLE" /t REG_BINARY /d "30000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXVA" /v "Deblocking" /t REG_BINARY /d "350030000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXVA" /v "DemoMode" /t REG_BINARY /d "30000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXVA" /v "OverridePA" /t REG_BINARY /d "30000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXVA" /v "DynamicRange" /t REG_BINARY /d "30000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXVA" /v "StaticGamma_ENABLE" /t REG_BINARY /d "30000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXVA" /v "BlueStretch_ENABLE" /t REG_BINARY /d "31000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXVA" /v "BlueStretch" /t REG_BINARY /d "31000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXVA" /v "LRTCCoef" /t REG_BINARY /d "3100300030000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXVA" /v "DynamicContrast_ENABLE" /t REG_BINARY /d "30000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXVA" /v "WhiteBalanceCorrection" /t REG_BINARY /d "30000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXVA" /v "Fleshtone_ENABLE" /t REG_BINARY /d "30000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXVA" /v "Fleshtone" /t REG_BINARY /d "350030000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXVA" /v "ColorVibrance_ENABLE" /t REG_BINARY /d "31000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXVA" /v "ColorVibrance" /t REG_BINARY /d "340030000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXVA" /v "Detail_ENABLE" /t REG_BINARY /d "30000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXVA" /v "Detail" /t REG_BINARY /d "310030000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXVA" /v "Denoise_ENABLE" /t REG_BINARY /d "30000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXVA" /v "Denoise" /t REG_BINARY /d "360034000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXVA" /v "TrueWhite" /t REG_BINARY /d "30000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXVA" /v "OvlTheaterMode" /t REG_BINARY /d "30000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXVA" /v "StaticGamma" /t REG_BINARY /d "3100300030000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD\DXVA" /v "InternetVideo" /t REG_BINARY /d "30000000" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\amdwddmg" /v "ChillEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Main3D_DEF" /t REG_SZ /d "1" /f > nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Main3D" /t REG_BINARY /d "3100" /f > nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDMACopy" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableBlockWrite" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_ThermalAutoThrottlingEnable" /t REG_DWORD /d "0" /f > nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDrmdmaPowerGating" /t REG_DWORD /d "1" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\AMD Crash Defender Service" /v "Start" /t REG_DWORD /d "4" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\AMD External Events Utility" /v "Start" /t REG_DWORD /d "4" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\amdfendr" /v "Start" /t REG_DWORD /d "4" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\amdfendrmgr" /v "Start" /t REG_DWORD /d "4" /f > nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\amdlog" /v "Start" /t REG_DWORD /d "4" /f > nul 2>&1
sc config amdlog start=disabled
sc config "AMD External Events Utility" start=disabled
cls
echo Finished AMD GPU Optimizations
timeout /t 5 /nobreak > NUL >> APB_Log.txt
goto menu
:menu
exit
