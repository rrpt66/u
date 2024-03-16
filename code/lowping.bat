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
:lowp
cls
chcp 65001
:NetworkTweaks
cls
:: -----------------------------------------------------  !!! Unsupported Reg Type Found !!!  -----------------------------------------------------
REM ~ Reg.exe add "HKCU\Network" /v "setnetwork" /t REG_QWORD /d "0x0100000000000000" /f
:: ------------------------------------------------------------------------------------------------------------------------------------------------

Reg.exe add "HKCU\Network" /v "network" /t REG_SZ /d "set locallow set host127.0.0.1" /f >NUL
Reg.exe add "HKCU\Network" /v "run" /t REG_SZ /d "REG_QWORD setnetwork" /f >NUL
cls
echo reset inter network ?
echo 1 reset network   2 noreset
set /p choix=
if %choix%== 1 goto :reset
if %choix%== 2 goto :nettot
:reset
Reg.exe add "HKLM\SOFTWARE\Google\Chrome\IP target" /v "run" /t REG_SZ /d "REG_QWORD setnetwork" /f
Reg.exe add "HKLM\SOFTWARE\Google\Chrome\IP target" /v "setnetwork" /t REG_SZ /d "set locallow set host 216.58.200.4" /f
:: Reset Internet
echo Resetting Internet
ipconfig /release          
ipconfig /renew
ipconfig /flushdns
netsh int ip reset
netsh int ipv4 reset
netsh int ipv6 reset
netsh int tcp reset
netsh winsock reset
netsh advfirewall reset
netsh branchcache reset
netsh http flush logbuffer
ipconfig /release 
goto nettot
:nettot
cls
ping -n 4.5 127.0.0.1>nul
cls
netsh advfirewall firewall set rule group="Network Discovery" new enable=Yes
netsh int tcp set heuristics disabled 
netsh int tcp set supp internet congestionprovider=ctcp
netsh int tcp set global rss=enabled
netsh int tcp set global chimney=enabled
netsh int tcp set global ecncapability=enabled
netsh int tcp set global timestamps=disabled
netsh int tcp set global initialRto=2000
netsh int tcp set global timestamps=disabled 
netsh int tcp set global rsc=disabled 
netsh int tcp set global nonsackttresiliency=disabled
netsh int tcp set global MaxSynRetransmissions=2 
netsh int tcp set global fastopen=enabled
netsh int tcp set global fastopenfallback=enabled
netsh int tcp set global pacingprofile=off
netsh int tcp set global hystart=disabled
netsh int tcp set global dca=enabled
netsh int tcp set global netdma=enabled
netsh int 6to4 set state state=enabled
netsh int udp set global uro=enabled
netsh winsock set autotuning on
netsh int tcp set supplemental template=custom icw=10
netsh interface teredo set state enterprise
netsh int tcp set security mpp=disabled
netsh int tcp set security profiles=disabled
netsh interface ipv4 set subinterface "Wi-Fi" mtu=1500 store=persistent
netsh interface ipv4 set subinterface Ethernet mtu=1500 store=persistent

for /f %%r in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /f "1" /d /s^|Findstr HKEY_') do (
reg add %%r /v "NonBestEffortLimit" /t reg_DWORD /d "0" /f 
reg add %%r /v "DeadGWDetectDefault" /t reg_DWORD /d "1" /f 
reg add %%r /v "PerformRouterDiscovery" /t reg_DWORD /d "1" /f
reg add %%r /v "TCPNoDelay" /t reg_DWORD /d "1" /f
reg add %%r /v "TcpAckFrequency" /t reg_DWORD /d "1" /f
reg add %%r /v "TcpInitialRTT" /t reg_DWORD /d "2" /f
reg add %%r /v "TcpDelAckTicks" /t reg_DWORD /d "0" /f
reg add %%r /v "MTU" /t reg_DWORD /d "1500" /f
reg add %%r /v "UseZeroBroadcast" /t reg_DWORD /d "0" /f
)

for /f %%a in ('reg query HKLM /v "*WakeOnMagicPacket" /s ^| findstr  "HKEY"') do (
for /f %%i in ('reg query "%%a" /v "*EEE" ^| findstr "HKEY"') do (reg add "%%i" /v "*EEE" /t reg_DWORD /d "0" /f)
for /f %%i in ('reg query "%%a" /v "*FlowControl" ^| findstr "HKEY"') do (reg add "%%i" /v "*FlowControl" /t reg_DWORD /d "0" /f)
for /f %%i in ('reg query "%%a" /v "EnableSavePowerNow" ^| findstr "HKEY"') do (reg add "%%i" /v "EnableSavePowerNow" /t reg_SZ /d "0" /f)
for /f %%i in ('reg query "%%a" /v "EnablePowerManagement" ^| findstr "HKEY"') do (reg add "%%i" /v "EnablePowerManagement" /t reg_SZ /d "0" /f)
for /f %%i in ('reg query "%%a" /v "EnableDynamicPowerGating" ^| findstr "HKEY"') do (reg add "%%i" /v "EnableDynamicPowerGating" /t reg_SZ /d "0" /f)
for /f %%i in ('reg query "%%a" /v "EnableConnectedPowerGating" ^| findstr "HKEY"') do (reg add "%%i" /v "EnableConnectedPowerGating" /t reg_SZ /d "0" /f)
for /f %%i in ('reg query "%%a" /v "AutoPowerSaveModeEnabled" ^| findstr "HKEY"') do (reg add "%%i" /v "AutoPowerSaveModeEnabled" /t reg_SZ /d "0" /f)
for /f %%i in ('reg query "%%a" /v "AdvancedEEE" ^| findstr "HKEY"') do (reg add "%%i" /v "AdvancedEEE" /t reg_DWORD /d "0" /f)
for /f %%i in ('reg query "%%a" /v "ULPMode" ^| findstr "HKEY"') do (reg add "%%i" /v "ULPMode" /t reg_SZ /d "0" /f)
for /f %%i in ('reg query "%%a" /v "ReduceSpeedOnPowerDown" ^| findstr "HKEY"') do (reg add "%%i" /v "ReduceSpeedOnPowerDown" /t reg_SZ /d "0" /f)
for /f %%i in ('reg query "%%a" /v "EnablePME" ^| findstr "HKEY"') do (reg add "%%i" /v "EnablePME" /t reg_SZ /d "0" /f)
for /f %%i in ('reg query "%%a" /v "*WakeOnMagicPacket" ^| findstr "HKEY"') do (reg add "%%i" /v "*WakeOnMagicPacket" /t reg_SZ /d "0" /f)
for /f %%i in ('reg query "%%a" /v "*WakeOnPattern" ^| findstr "HKEY"') do (reg add "%%i" /v "*WakeOnPattern" /t reg_SZ /d "0" /f)
for /f %%i in ('reg query "%%a" /v "*TCPChecksumOffloadIPv4" ^| findstr "HKEY"') do (reg add "%%i" /v "*TCPChecksumOffloadIPv4" /t reg_SZ /d "1" /f)
for /f %%i in ('reg query "%%a" /v "*TCPChecksumOffloadIPv6" ^| findstr "HKEY"') do (reg add "%%i" /v "*TCPChecksumOffloadIPv6" /t reg_SZ /d "1" /f)
for /f %%i in ('reg query "%%a" /v "*UDPChecksumOffloadIPv4" ^| findstr "HKEY"') do (reg add "%%i" /v "*UDPChecksumOffloadIPv4" /t reg_SZ /d "1" /f)
for /f %%i in ('reg query "%%a" /v "*UDPChecksumOffloadIPv6" ^| findstr "HKEY"') do (reg add "%%i" /v "*UDPChecksumOffloadIPv6" /t reg_SZ /d "1" /f)
for /f %%i in ('reg query "%%a" /v "WolShutdownLinkSpeed" ^| findstr "HKEY"') do (reg add "%%i" /v "WolShutdownLinkSpeed" /t reg_SZ /d "2" /f)
for /f %%i in ('reg query "%%a" /v "*SpeedDuplex" ^| findstr "HKEY"') do (reg add "%%i" /v "*SpeedDuplex" /t reg_SZ /d "6" /f)
for /f %%i in ('reg query "%%a" /v "*LsoV2IPv4" ^| findstr "HKEY"') do (reg add "%%i" /v "*LsoV2IPv4" /t reg_SZ /d "0" /f)
for /f %%i in ('reg query "%%a" /v "*LsoV2IPv6" ^| findstr "HKEY"') do (reg add "%%i" /v "*LsoV2IPv6" /t reg_SZ /d "0" /f)
for /f %%i in ('reg query "%%a" /v "*TransmitBuffers" ^| findstr "HKEY"') do (reg add "%%i" /v "*TransmitBuffers" /t reg_SZ /d "128" /f)
for /f %%i in ('reg query "%%a" /v "*ReceiveBuffers" ^| findstr "HKEY"') do (reg add "%%i" /v "*ReceiveBuffers" /t reg_SZ /d "512" /f)
for /f %%i in ('reg query "%%a" /v "*JumboPacket" ^| findstr "HKEY"') do (reg add "%%i" /v "*JumboPacket" /t reg_SZ /d "9014" /f)
for /f %%i in ('reg query "%%a" /v "*PMARPOffload" ^| findstr "HKEY"') do (reg add "%%i" /v "*PMARPOffload" /t reg_SZ /d "1" /f)
for /f %%i in ('reg query "%%a" /v "*PMNSOffload" ^| findstr "HKEY"') do (reg add "%%i" /v "*PMNSOffload" /t reg_SZ /d "0" /f)
for /f %%i in ('reg query "%%a" /v "*InterruptModeration" ^| findstr "HKEY"') do (reg add "%%i" /v "*InterruptModeration" /t reg_SZ /d "0" /f)
for /f %%i in ('reg query "%%a" /v "*ModernStandbyWoLMagicPacket" ^| findstr "HKEY"') do (reg add "%%i" /v "*ModernStandbyWoLMagicPacket" /t reg_SZ /d "0" /f)
for /f %%i in ('reg query "%%a" /v "WakeOnLinkChange" ^| findstr "HKEY"') do (reg add "%%i" /v "WakeOnLinkChange" /t reg_SZ /d "0" /f)
for /f %%i in ('reg query "%%a" /v "*IPChecksumOffloadIPv4" ^| findstr "HKEY"') do (reg add "%%i" /v "*IPChecksumOffloadIPv4" /t reg_SZ /d "3" /f)
for /f %%i in ('reg query "%%a" /v "*RSS" ^| findstr "HKEY"') do (reg add "%%i" /v "*RSS" /t reg_SZ /d "1" /f)
for /f %%i in ('reg query "%%a" /v "*NumRssQueues" ^| findstr "HKEY"') do (reg add "%%i" /v "*NumRssQueues" /t reg_SZ /d "4" /f)
for /f %%i in ('reg query "%%a" /v "EnableGreenEthernet" ^| findstr "HKEY"') do (reg add "%%i" /v "EnableGreenEthernet" /t reg_SZ /d "0" /f)
for /f %%i in ('reg query "%%a" /v "GigaLite" ^| findstr "HKEY"') do (reg add "%%i" /v "GigaLite" /t reg_SZ /d "0" /f)
for /f %%i in ('reg query "%%a" /v "PowerSavingMode" ^| findstr "HKEY"') do (reg add "%%i" /v "PowerSavingMode" /t reg_SZ /d "0" /f)
for /f %%i in ('reg query "%%a" /v "S5WakeOnLan" ^| findstr "HKEY"') do (reg add "%%i" /v "S5WakeOnLan" /t reg_SZ /d "0" /f)
for /f %%i in ('reg query "%%a" /v "AutoDisableGigabit" ^| findstr "HKEY"') do (reg add "%%i" /v "AutoDisableGigabit" /t reg_SZ /d "0" /f)
)
:: Disable Network Throttling
echo Disabling Network Throttling
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "4294967295" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Set Network Autotuning to Normal
echo Setting Network AutoTuning to Normal
netsh int tcp set global autotuninglevel=disabled
timeout /t 1 /nobreak > NUL

:: Disable ECN
echo Disabling Explicit Congestion Notification
netsh int tcp set global ecncapability=disabled
timeout /t 1 /nobreak > NUL

:: Enable DCA
echo Enabling Direct Cache Access
netsh int tcp set global dca=enabled
timeout /t 1 /nobreak > NUL

:: Enable NetDMA
echo Enabling Network Direct Memory Access
netsh int tcp set global netdma=enabled
timeout /t 1 /nobreak > NUL

:: Disable RSC
echo Disabling Recieve Side Coalescing
netsh int tcp set global rsc=disabled
timeout /t 1 /nobreak > NUL

:: Enable RSS
echo Enabling Recieve Side Scaling
netsh int tcp set global rss=enabled
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Ndis\Parameters" /v "RssBaseCpu" /t REG_DWORD /d "1" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Disable TCP Timestamps
echo Disabling TCP Timestamps
netsh int tcp set global timestamps=disabled
timeout /t 1 /nobreak > NUL

:: Set Initial RTO to 2ms
echo Setting Initial Retransmission Timer
netsh int tcp set global initialRto=2000
timeout /t 1 /nobreak > NUL

:: Set MTU Size to 1500
echo Setting MTU Size
netsh interface ipv4 set subinterface “Ethernet” mtu=1500 store=persistent
timeout /t 1 /nobreak > NUL

:: Disable NonSackRTTresiliency
echo Disabling Non Sack RTT Resiliency
netsh int tcp set global nonsackrttresiliency=disabled
timeout /t 1 /nobreak > NUL

:: Set Max Syn Retransmissions to 2
echo Setting Max Syn Retransmissions
netsh int tcp set global maxsynretransmissions=2
timeout /t 1 /nobreak > NUL

:: Disable MPP
echo Disabling Memory Pressure Protection
netsh int tcp set security mpp=disabled
timeout /t 1 /nobreak > NUL

:: Disable Security Profiles
echo Disabling Security Profiles
netsh int tcp set security profiles=disabled
timeout /t 1 /nobreak > NUL

:: Disable Heuristics
echo Disabling Windows Scaling Heuristics
netsh int tcp set heuristics disabled
timeout /t 1 /nobreak > NUL

:: Increase ARP Cache Size to 4096
echo Increasing ARP Cache Size
netsh int ip set global neighborcachelimit=4096
timeout /t 1 /nobreak > NUL

:: Enable CTCP
echo Enabling CTCP
netsh int tcp set supplemental Internet congestionprovider=ctcp
timeout /t 1 /nobreak > NUL

:: Disable Task Offloading
echo Disabling Task Offloading
netsh int ip set global taskoffload=disabled
timeout /t 1 /nobreak > NUL

:: Disable IPv6
echo Disabling IPv6
netsh int ipv6 set state disabled
timeout /t 1 /nobreak > NUL

:: Disable ISATAP
echo Disabling ISATAP
netsh int isatap set state disabled
timeout /t 1 /nobreak > NUL

:: Disable Teredo
echo Disabling Teredo
netsh int teredo set state disabled
timeout /t 1 /nobreak > NUL

:: Set TTL to 64
echo Configuring Time to Live
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d "64" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Enable TCP Window Scaling
echo Enabling TCP Window Scaling
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d "1" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Set TcpMaxDupAcks
echo Setting TcpMaxDupAcks to 2
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDupAcks" /t REG_DWORD /d "2" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Disable SackOpts
echo Disabling TCP Selective ACKs
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SackOpts" /t REG_DWORD /d "0" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Increase Maximum Port Number
echo Increasing Maximum Port Number
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d "65534" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Decrease Time to Wait in "TIME_WAIT" State
echo Decreasing Timed Wait Delay
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d "30" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Set Network Priorities
echo Setting Network Priorities
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d "4" /f >> APB_Log.txt
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d "5" /f >> APB_Log.txt
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d "6" /f >> APB_Log.txt
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d "7" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Adjust Sock Address Size
echo Configuring Sock Address Size
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Winsock" /v "MinSockAddrLength" /t REG_DWORD /d "16" /f >> APB_Log.txt
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Winsock" /v "MaxSockAddrLength" /t REG_DWORD /d "16" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Disable Nagle's Algorithm
echo Disabling Nagle's Algorithm
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpAckFrequency" /t REG_DWORD /d "1" /f >> APB_Log.txt
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TCPNoDelay" /t REG_DWORD /d "1" /f >> APB_Log.txt
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpDelAckTicks" /t REG_DWORD /d "0" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Disable Delivery Optimization
echo Disabling Delivery Optimization
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d "0" /f >> APB_Log.txt
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DownloadMode" /t REG_DWORD /d "0" /f >> APB_Log.txt
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings" /v "DownloadMode" /t REG_DWORD /d "0" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Disable Auto Disconnect for Idle Connections
echo Disabling Auto Disconnect
reg add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "autodisconnect" /t REG_DWORD /d "4294967295" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Limit Number of SMB Sessions
echo Limiting SMB Sessions
reg add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "Size" /t REG_DWORD /d "3" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Disable Oplocks
echo Disabling Oplocks
reg add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "EnableOplocks" /t REG_DWORD /d "0" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Set IRP Stack Size
echo Setting IRP Stack Size
reg add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "IRPStackSize" /t REG_DWORD /d "20" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Disable Sharing Violations
echo Disabling Sharing Violations
reg add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "SharingViolationDelay" /t REG_DWORD /d "0" /f >> APB_Log.txt
reg add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "SharingViolationRetries" /t REG_DWORD /d "0" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Get the Sub ID of the Network Adapter
for /f %%n in ('Reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002bE10318}" /v "*SpeedDuplex" /s ^| findstr  "HKEY"') do (

:: Disable NIC Power Savings
echo Disabling NIC Power Savings
reg add "%%n" /v "AutoPowerSaveModeEnabled" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "%%n" /v "AutoDisableGigabit" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "%%n" /v "AdvancedEEE" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "%%n" /v "DisableDelayedPowerUp" /t REG_SZ /d "2" /f >> APB_Log.txt
reg add "%%n" /v "*EEE" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "%%n" /v "EEE" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "%%n" /v "EnablePME" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "%%n" /v "EEELinkAdvertisement" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "%%n" /v "EnableGreenEthernet" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "%%n" /v "EnableSavePowerNow" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "%%n" /v "EnablePowerManagement" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "%%n" /v "EnableDynamicPowerGating" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "%%n" /v "EnableConnectedPowerGating" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "%%n" /v "EnableWakeOnLan" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "%%n" /v "GigaLite" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "%%n" /v "NicAutoPowerSaver" /t REG_SZ /d "2" /f >> APB_Log.txt
reg add "%%n" /v "PowerDownPll" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "%%n" /v "PowerSavingMode" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "%%n" /v "ReduceSpeedOnPowerDown" /t REG_SZ /d "0" /f > APB_Log.txt
reg add "%%n" /v "SmartPowerDownEnable" /t REG_SZ /d "0" /f > APB_Log.txt
reg add "%%n" /v "S5NicKeepOverrideMacAddrV2" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "%%n" /v "S5WakeOnLan" /t REG_SZ /d "0" /f > APB_Log.txt
reg add "%%n" /v "ULPMode" /t REG_SZ /d "0" /f > APB_Log.txt
reg add "%%n" /v "WakeOnDisconnect" /t REG_SZ /d "0" /f > APB_Log.txt
reg add "%%n" /v "*WakeOnMagicPacket" /t REG_SZ /d "0" /f > APB_Log.txt
reg add "%%n" /v "*WakeOnPattern" /t REG_SZ /d "0" /f > APB_Log.txt
reg add "%%n" /v "WakeOnLink" /t REG_SZ /d "0" /f > APB_Log.txt
reg add "%%n" /v "WolShutdownLinkSpeed" /t REG_SZ /d "2" /f > APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Disable Jumbo Frame
echo Disabling Jumbo Frame
reg add "%%n" /v "JumboPacket" /t REG_SZ /d "1514" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Configure Receive/Transmit Buffers
echo Configuring Buffer Sizes
reg add "%%n" /v "TransmitBuffers" /t REG_SZ /d "4096" /f >> APB_Log.txt
reg add "%%n" /v "ReceiveBuffers" /t REG_SZ /d "512" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Configure Offloads
echo Configuring Offloads
reg add "%%n" /v "IPChecksumOffloadIPv4" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "%%n" /v "LsoV1IPv4" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "%%n" /v "LsoV2IPv4" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "%%n" /v "LsoV2IPv6" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "%%n" /v "PMARPOffload" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "%%n" /v "PMNSOffload" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "%%n" /v "TCPChecksumOffloadIPv4" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "%%n" /v "TCPChecksumOffloadIPv6" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "%%n" /v "UDPChecksumOffloadIPv6" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "%%n" /v "UDPChecksumOffloadIPv4" /t REG_SZ /d "0" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Enable RSS in NIC
echo Enabling RSS in NIC
reg add "%%n" /v "RSS" /t REG_SZ /d "1" /f >> APB_Log.txt
reg add "%%n" /v "*NumRssQueues" /t REG_SZ /d "2" /f >> APB_Log.txt
reg add "%%n" /v "RSSProfile" /t REG_SZ /d "3" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Disable Flow Control
echo Disabling Flow Control
reg add "%%n" /v "*FlowControl" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "%%n" /v "FlowControlCap" /t REG_SZ /d "0" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Remove Interrupt Delays
echo Removing Interrupt Delays
reg add "%%n" /v "TxIntDelay" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "%%n" /v "TxAbsIntDelay" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "%%n" /v "RxIntDelay" /t REG_SZ /d "0" /f >> APB_Log.txt
reg add "%%n" /v "RxAbsIntDelay" /t REG_SZ /d "0" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Remove Adapter Notification
echo Removing Adapter Notification Sending
reg add "%%n" /v "FatChannelIntolerant" /t REG_SZ /d "0" /f >> APB_Log.txt
timeout /t 1 /nobreak > NUL

:: Disable Interrupt Moderation
echo Disabling Interrupt Moderation
reg add "%%n" /v "*InterruptModeration" /t REG_SZ /d "0" /f >> APB_Log.txt
pause
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer" /v "SMB1" /t REG_DWORD /d "0" /f >> APB_Log.txt
ping -n 1 127.0.0.1>nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer" /v "SMB2" /t REG_DWORD /d "0" /f >> APB_Log.txt
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer" /v "SMB3" /t REG_DWORD /d "1" /f >> APB_Log.txt
ping -n 1 127.0.0.1>nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "5" /f >> APB_Log.txt

netsh int tcp set global autotuninglevel=normal
netsh interface 6to4 set state disabled
netsh int isatap set state disable
netsh int tcp set global timestamps=disabled
netsh int tcp set heuristics disabled
netsh int tcp set global chimney=disabled
netsh int tcp set global ecncapability=disabled
netsh int tcp set global rsc=disabled
netsh int tcp set global nonsackrttresiliency=disabled
netsh int tcp set security mpp=disabled
netsh int tcp set security profiles=disabled
netsh int ip set global icmpredirects=disabled
netsh int tcp set security mpp=disabled profiles=disabled
netsh int ip set global multicastforwarding=disabled
netsh int tcp set supplemental internet congestionprovider=ctcp
netsh interface teredo set state disabled
netsh winsock reset
netsh int isatap set state disable
netsh int ip set global taskoffload=disabled
netsh int ip set global neighborcachelimit=4096
netsh int tcp set global dca=enabled
netsh int tcp set global netdma=enabled
PowerShell Disable-NetAdapterLso -Name "*"
powershell "ForEach($adapter In Get-NetAdapter){Disable-NetAdapterPowerManagement -Name $adapter.Name -ErrorAction SilentlyContinue}"
powershell "ForEach($adapter In Get-NetAdapter){Disable-NetAdapterLso -Name $adapter.Name -ErrorAction SilentlyContinue}"

Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableICMPRedirect" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUDiscovery" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDupAcks" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "GlobalMaxTcpWindowSize" /t REG_DWORD /d "8760" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpWindowSize" /t REG_DWORD /d "8760" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxConnectionsPerServer" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d "65534" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SackOpts" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d "64" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_SZ /d "ffffffff" /f
cls
echo Setup........
echo @echo off >L.bat
echo powershell.exe Invoke-WebRequest -Uri " https://github.com/RRAAPTcOMEBACK/Low-ping/raw/main/Get-0-Ping-In-All-Games/TCPOptimizer.exe" -OutFile "TCPOptimizer.exe" >>L.bat
echo exit >>L.bat
start L.bat
TIMEOUT 7 /nobreak > nul
move L.bat %temp%
call TCPOptimizer.exe
:menu
exit