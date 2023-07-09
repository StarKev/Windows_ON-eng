@echo off
>NUL 2>&1 reg.exe query "HKU\S-1-5-19" || (
    ECHO SET UAC = CreateObject^("Shell.Application"^) > "%TEMP%\Getadmin.vbs"
    ECHO UAC.ShellExecute "%~f0", "%1", "", "runas", 1 >> "%TEMP%\Getadmin.vbs"
    "%TEMP%\Getadmin.vbs"
    DEL /f /q "%TEMP%\Getadmin.vbs" 2>NUL
    Exit /b
)

title Windows ON

echo.
echo ============================================================
echo Author: StarKev
echo ============================================================
echo Version: 1.0
echo.
echo.
echo Press any key to start.
echo.
pause > nul
goto menu

REM select the Windows version to be activated
:menu
cls
echo.
title Windows ON
echo Choose your version of Windows 10/11 to activate:
echo.
echo 1) Family / Core
echo 2) Professionel
echo 3) Professional for Workstations
echo 4) Professionel Education
echo 5) Education
echo 6) Enterprise
echo 7) Enterprise 2019 LTSC ( Win10 )
echo.
echo Other options :
echo.
echo d) Delete Windows licence
echo a) Activate with a custom key
echo c) Check Windows activation status
echo x) Exit
echo.

set choice=
set /p choice="Enter your choice: "
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto Family
if '%choice%'=='2' goto Professionel
if '%choice%'=='3' goto proWKST
if '%choice%'=='4' goto proEDU
if '%choice%'=='5' goto Education
if '%choice%'=='6' goto Enterprise
if '%choice%'=='7' goto LTSC2019
if '%choice%'=='d' goto delWin
if '%choice%'=='a' goto winLicen
if '%choice%'=='c' goto stat
if '%choice%'=='x' goto exit
echo "%choice%" is not valid, try again.
pause
goto menu

REM Main options
:Family
cls
echo.
echo Currently activating Windows....
echo.
cscript %SYSTEMROOT%\System32\slmgr.vbs /ipk YTMG3-N6DKC-DKB77-7M9GH-8HVX7 > nul
cscript %SYSTEMROOT%\System32\slmgr.vbs /skms kms.03k.org > nul
cscript %SYSTEMROOT%\System32\slmgr.vbs /ato > nul
goto end

:Professionel
cls
echo.
echo Currently activating Windows....
echo.
cscript %SYSTEMROOT%\System32\slmgr.vbs /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX > nul
cscript %SYSTEMROOT%\System32\slmgr.vbs /skms kms.03k.org > nul
cscript %SYSTEMROOT%\System32\slmgr.vbs /ato > nul
goto end

:proWKST
cls
echo.
echo Currently activating Windows....
echo.
cscript %SYSTEMROOT%\System32\slmgr.vbs /ipk NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J > nul
cscript %SYSTEMROOT%\System32\slmgr.vbs /skms kms.03k.org > nul
cscript %SYSTEMROOT%\System32\slmgr.vbs /ato > nul
goto end

:proEDU
cls
echo.
echo Currently activating Windows....
echo.
cscript %SYSTEMROOT%\System32\slmgr.vbs /ipk 6TP4R-GNPTD-KYYHQ-7B7DP-J447Y > nul
cscript %SYSTEMROOT%\System32\slmgr.vbs /skms kms.03k.org > nul
cscript %SYSTEMROOT%\System32\slmgr.vbs /ato > nul
goto end

:Education
cls
echo.
echo Currently activating Windows....
echo.
cscript %SYSTEMROOT%\System32\slmgr.vbs /ipk NPPR9-FWDCX-D2C8J-H872K-YT43 > nul
cscript %SYSTEMROOT%\System32\slmgr.vbs /skms kms.03k.org > nul
cscript %SYSTEMROOT%\System32\slmgr.vbs /ato > nul
goto end

:Enterprise
cls
echo.
echo Currently activating Windows....
echo.
cscript %SYSTEMROOT%\System32\slmgr.vbs /ipk NW6C2-QMPVW-D7KKK-3GKT6-VCFB2 > nul
cscript %SYSTEMROOT%\System32\slmgr.vbs /skms kms.03k.org > nul
cscript %SYSTEMROOT%\System32\slmgr.vbs /ato > nul
goto end

:LTSC2019
cls
echo.
echo Currently activating Windows....
echo.
cscript %SYSTEMROOT%\System32\slmgr.vbs /ipk M7XTQ-FN8P6-TTKYV-9D4CC-J462D > nul
cscript %SYSTEMROOT%\System32\slmgr.vbs /skms kms.03k.org > nul
cscript %SYSTEMROOT%\System32\slmgr.vbs /ato > nul
goto end

:end
cscript %SYSTEMROOT%\System32\slmgr.vbs -dli
pause
goto menu

REM Other options
:delWin
cls
echo.
cscript %SYSTEMROOT%\System32\slmgr.vbs -upk > nul
echo.
echo The Windows licence has been uninstalled
echo.
pause
goto menu

:winLicen
cls
echo.
echo Enter your activation key in the format XXXXX-XXXXX-XXXXX-XXXXX-XXXXX
echo.
set /p key="Enter your choice: ")
echo.
echo Activation en cours....
cscript %SYSTEMROOT%\System32\slmgr.vbs /ipk %key% > nul
cscript %SYSTEMROOT%\System32\slmgr.vbs -dli
echo.
echo The licence key has been installed
echo.
pause
goto menu

:stat
cls
echo.
cscript %SYSTEMROOT%\System32\slmgr.vbs -dli
echo.
pause
goto menu

:exit
exit