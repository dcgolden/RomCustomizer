:: Created by deman88
:: Feel free to modify, but DON'T redistribute as your own, thank you.
@echo off
color F1
mode con cols=130
mode con lines=40
:DISCLAIMER
ECHO.
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
ECHO Use at your own RISK
ECHO I take no responsibility for bricked phones, messed up ROMS etc.
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
ECHO.
PAUSE
GOTO MENU
:MENU
CLS
ECHO.
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
ECHO This progam allows you to customize your ROM it is used at your own risk
ECHO In order to use this program have your phone plugged in and usb debugging on.
ECHO Options with (X) after them are aesthetic changes only
ECHO Adding sysrw and syro will allow you to mount as read-write and read-only from adb shell and from terminal emulator on the phone
ECHO Editing build.prop allows you to changed a bunch of options that show in Settings ^> About phone on most roms with JIT it can turn it on and off.
ECHO Boot Animation menu allows you to backup and restore BootAni's as well as flash new ones and included examples
ECHO Signing .zips and .apks allows the phone to acccept them such as in update.zips and edited .apks
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
ECHO.
ECHO 1 - Reboot
ECHO 2 - Reboot to Recovery
ECHO 3 - Change Carrier Text (Vanilla/CM Roms Only)(X)
ECHO 4 - Add sysrw and sysro commands
ECHO 5 - Edit build.prop
ECHO 6 - Boot Animation Menu
ECHO 7 - Sign .zip or .apk (JRE required)
ECHO 8 - Sign using alternate method (Only if regular method doesn't work)
ECHO 9 - Font Menu
ECHO 10 - Splash Menu
ECHO 11 - Exit
SET Start=
SET /P START=Type a number then press ENTER:%=%
IF "%START%"=="1" GOTO REBOOT
IF "%START%"=="2" GOTO REBOOTRECOVERY
IF "%START%"=="3" GOTO SETCARRIERVAR
IF "%START%"=="4" GOTO ADD
IF "%START%"=="5" GOTO PROPOPS
IF "%START%"=="6" GOTO BOOTOPS
IF "%START%"=="7" GOTO SIGN
IF "%START%"=="8" GOTO ALTSIGN
IF "%START%"=="9" GOTO FONTMENUSET
IF "%START%"=="10" GOTO SPLASHOPS
IF "%START%"=="11" GOTO EXIT
IF "%START%"=="" GOTO MENU
IF not "%START%"=="ControlValue" GOTO MENU
:SETCARRIERVAR
CLS
SET CARRIERVAR=
SET /P CARRIERVAR=Type carrier text here then press ENTER:%=%
if "%CARRIERVAR%"=="" GOTO SETCARRIERVAR
GOTO DELIFEXIST
:DELIFEXIST
if exist Files\eri.xml (
    del Files\eri.xml
) else (
    GOTO CREATE
)
:CREATE
ECHO ^<^E^r^i^F^i^l^e ^V^e^r^s^i^o^n^N^u^m^b^e^r^=^"^1^3^5^7^" ^N^u^m^b^e^r^O^f^E^r^i^E^n^t^r^i^e^s^=^"^1^" ^E^r^i^F^i^l^e^T^y^p^e^=^"^1^"^> >Files\eri.xml
ECHO ^<^C^a^l^l^P^r^o^m^p^t^I^d ^I^d^=^"^0^" ^C^a^l^l^P^r^o^m^p^t^T^e^x^t^=^"^C^a^l^l^P^r^o^m^p^t^I^d^0^"^/^> >>Files\eri.xml
ECHO ^<^C^a^l^l^P^r^o^m^p^t^I^d^ ^I^d^=^"^1^" ^C^a^l^l^P^r^o^m^p^t^T^e^x^t^=^"^C^a^l^l^P^r^o^m^p^t^I^d^1^"^/^> >>Files\eri.xml
ECHO ^<^C^a^l^l^P^r^o^m^p^t^I^d ^I^d^=^"^2^" ^C^a^l^l^P^r^o^m^p^t^T^e^x^t^=^"^C^a^l^l^P^r^o^m^p^t^I^d^2^"^/^> >>Files\eri.xml
ECHO ^<^E^r^i^I^n^f^o^ ^R^o^a^m^i^n^g^I^n^d^i^c^a^t^o^r^=^"^1^2^8^" ^I^c^o^n^I^n^d^e^x^=^"^1^" ^I^c^o^n^M^o^d^e^=^"^0^" ^E^r^i^T^e^x^t^=^"%CARRIERVAR%" CallPromptId="^0^" ^A^l^e^r^t^I^d^=^"^0^"^/^> >>Files\eri.xml
ECHO ^<^/^E^r^i^F^i^l^e^> >>Files\eri.xml
GOTO SETTEXT
:SETTEXT
CLS
SET C=
Set /P C=Y to set %CARRIERVAR% as carrier text or N to Cancel:%=%
IF /I "%C%"=="Y" GOTO PUSH
IF /I "%C%"=="N" GOTO MENU
IF "%C%"=="" GOTO SETTEXT
IF NOT "%C%"=="ControlValue" GOTO SETTEXT
:PUSH
CLS
files\adb shell mount -o rw,remount /dev/block/mtdblock3 /system >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO ADBFAIL
files\adb push files\eri.xml /data/eri.xml >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO ADBFAIL
GOTO REBOOTORNO
:ADBFAIL
CLS
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
ECHO Unable to interact with the device over adb, ensure it is plugged in and USB debugging is on
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
Pause
GOTO MENU
:ADD
CLS
SET PushYN=
SET /P PUSHYN=Type Y add sysro and sysrw commands or n to return to menu and abort:%=%
IF /I "%PUSHYN%"=="Y" GOTO PUSH/CHMOD
IF /I "%PUSHYN%"=="N" GOTO MENU
IF /I "%PushYN%"=="" GOTO ADD
IF NOT "%PushYN%=="ControlValue" GOTO ADD
:PUSH/CHMOD
files\adb shell mount -o rw,remount /dev/block/mtdblock3 /system >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO ADBFAIL
Files\adb push files\sysrw /system/bin >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO ADBFAIL
Files\adb push files\sysro /system/bin >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO ADBFAIL
Files\adb shell chmod 755 /system/bin/sysrw >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO ADBFAIL
Files\adb shell chmod 755 /system/bin/sysro >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO ADBFAIL
GOTO SYSSUCCESS
:SYSSUCCESS
CLS
ECHO Sysro and sysrw added succesfully!
PAUSE
GOTO MENU 
:REBOOTORNO
CLS
ECHO The files have been pushed, in order for them to take effect you need to reboot
SET Reyn2=
SET /P ReYN2=Type r to reboot or n to return to menu and reboot later:%=%
IF /I "%ReYN2%"=="r" GOTO REBOOT
IF /I "%ReYN2%"=="n" GOTO MENU
IF "%ReYN2%"=="" GOTO REBOOTORNO
IF NOT "%ReYN%"=="ControlValue" GOTO REBOOTORNO
:REBOOTRECOVERY
Files\adb reboot recovery >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO ADBFAIL
GOTO MENU
:REBOOT
Files\adb reboot >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO ADBFAIL
GOTO MENU
:EXIT
CLS
ECHO.
ECHO.
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
ECHO Created by deman88, thanks to the help of TheFuzz4, Eclips3, CaptainKrtek,
ECHO and t2noob for all the font flasher code . Also, a-wilcoxj helped out IMMENSELY by testing literally everything! 
ECHO I hope this small project of mine helped you. 
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
ECHO.
ECHO.
Pause
EXIT
:PROPOPS
CLS
ECHO.
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
ECHO This progam allows you to customize your ROM it is used at your own risk
ECHO In order to use this program have your phone plugged in and usb debugging on.
ECHO Options with (X) after them are aesthetic changes only
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
ECHO.
ECHO 1  - BackUp build.prop
ECHO 2  - Change Model (X)
ECHO 3  - Change Build Display ID (X)
Echo 4  - Change Manufacturer (X)
ECHO 5  - Change Android Version (X)
ECHO 6  - Change Mod Version (X)
ECHO 7  - Turn JIT OFF 
ECHO 8  - Turn JIT ON
ECHO 9  - Reboot
ECHO 10 - Reboot Recovery
ECHO 11 - Return to Menu
SET PROPOPSTART=
SET /P PROPOPSTART=Type a number then press ENTER:%=%
IF "%PROPOPSTART%"=="1" GOTO PROPBACK
IF "%PROPOPSTART%"=="2" GOTO MODELCHANGE
IF "%PROPOPSTART%"=="3" GOTO BIDCHANGE
IF "%PROPOPSTART%"=="4" GOTO MFACCHANGE
IF "%PROPOPSTART%"=="5" GOTO ANDVCHANGE
IF "%PROPOPSTART%"=="6" GOTO MODVCHANGE
IF "%PROPOPSTART%"=="7" GOTO JITWARNING
IF "%PROPOPSTART%"=="8" GOTO JITWARNINGON
IF "%PROPOPSTART%"=="9" GOTO REBOOT
IF "%PROPOPSTART%"=="10" GOTO REBOOTRECOVETY
IF "%PROPOPSTART%"=="11" GOTO MENU
IF "%PROPOPSTART%"=="" GOTO PROPOPS
IF not "%PROPOPSTART%"=="ControlValue" GOTO PROPOPS
:MODELCHANGE
CLS
SET PROPADBPULL=Model
SET MODELVAR=
SET /P MODELVAR=Type Model text here then press ENTER:%=%
if "%MODELVAR%"=="" GOTO MODELCHANGE
GOTO MODELYN
:MODELYN
CLS
SET MODELYN=
SET /P MODELYN=Type Y to set %MODELVAR% as Model or N to abort:%=%
IF /I "%MODELYN%"=="Y" GOTO PROPADBPULL
IF /I "%MODELYN%"=="n" GOTO PROPOPS
IF "%MODELYN%"=="" GOTO MODELYN
IF NOT "%MODELYN%"=="ControlValue" GOTO MODELYN
:PROPADBPULL
files\adb pull /system/build.prop >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO ADBFAILPROP
move /Y build.prop Files\build.prop >NUL 2>&1
GOTO %PropADBPULL%TEXT
:ADBFAILPROP
CLS
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
ECHO Unable to interact with the device over adb, ensure it is plugged in and USB debugging is on
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
Pause
GOTO PROPOPS
:MODELTEXT
FINDSTR /v ro.product.model= files\build.prop >files\new.prop
DEL files\build.prop
REN files\new.prop build.prop
ECHO ro.product.model^=%MODELVAR% >>files\build.prop
GOTO MODELPUSHYN
:MODELPUSHYN
CLS
SET MODELPUSHYN=
SET /P MODELPUSHYN=Type Y to push the edited build.prop or n to return to menu and abort:%=%
IF /I "%MODELPUSHYN%"=="Y" GOTO PROPADBPUSH
IF /I "%MODELPUSHYN%"=="N" GOTO PROPOPS
IF  "%MODELPUSHYN%"=="" GOTO MODELPUSHYN
IF NOT "%MODELPUSHYN%"=="ControlValue" GOTO MODELPUSHYN
:PROPADBPUSH
files\adb shell mount -o rw,remount /dev/block/mtdblock3 /system >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO ADBFAILPROP
files\adb push files\build.prop /system/build.prop >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO ADBFAILPROP
GOTO PROPREBOOTORNO
:PROPREBOOTORNO
CLS
ECHO The files have been pushed, in order for them to take effect you need to reboot
SET PUSHREYN2=
SET /P PUSHREYN2=Type r to reboot or n to return to menu and continue making changes:%=%
IF /I "%PUSHREYN2%"=="r" GOTO REBOOT
IF /I "%PUSHREYN2%"=="n" GOTO PROPOPS
IF "%PUSHREYN2%"=="" GOTO PROPREBOOTORNO
IF NOT "%PUSHREYN2%"=="ControlValue" GOTO PROPREBOOTORNO
:BIDCHANGE
CLS
SET PROPADBPULL=BID
SET BIDVAR=
SET /P BIDVAR=Type BuildID text here then press ENTER:%=%
if "%BIDVAR%"=="" GOTO BIDCHANGE
GOTO BIDYN
:BIDYN
CLS
SET BIDYN=
SET /P BIDYN=Type Y to set %BIDVAR% as BuildID or N to abort:%=%
IF /I "%BIDYN%"=="Y" GOTO PROPADBPULL
IF /I "%BIDYN%"=="n" GOTO PROPOPS
IF "%BIDYN%"=="" GOTO BIDYN
IF NOT "%BIDYN%"=="ControlValue" GOTO BIDYN
:BIDTEXT
FINDSTR /v ro.build.display.id=* files\build.prop >files\new.prop
DEL files\build.prop
REN files\new.prop build.prop
ECHO ro.build.display.id^=%BIDVAR% >>files\build.prop
GOTO BIDPUSHYN
:BIDPUSHYN
CLS
SET BIDPUSHYN=
SET /P BIDPUSHYN=Type Y to push the edited build.prop or n to return to menu and abort:%=%
IF /I "%BIDPUSHYN%"=="Y" GOTO PROPADBPUSH
IF /I "%BIDPUSHYN%"=="N" GOTO PROPOPS
IF  "%BIDPUSHYN%"=="" GOTO BIDPUSHYN
IF NOT "%BIDPUSHYN%"=="ControlValue" GOTO BIDPUSHYN
:MFACCHANGE
CLS
SET PROPADBPULL=MFAC
SET MFACVAR=
SET /P MFACVAR=Type MFAC text here then press ENTER:%=%
if "%MFACVAR%"=="" GOTO MFACCHANGE
GOTO MFACYN
:MFACYN
CLS
SET MFACYN=
SET /P MFACYN=Type Y to set %MFACVAR% as Manufacturer or N to abort:%=%
IF /I "%MFACYN%"=="Y" GOTO PROPADBPULL
IF /I "%MFACYN%"=="n" GOTO PROPOPS
IF "%MFACYN%"=="" GOTO MFACYN
IF NOT "%MFACYN%"=="ControlValue" GOTO MFACYN
:MFACTEXT
FINDSTR /v ro.product.manufacturer=* files\build.prop >files\new.prop
DEL files\build.prop
REN files\new.prop build.prop
ECHO ro.product.manufacturer^=%MFACVAR% >>files\build.prop
GOTO MFACPUSHYN
:MFACPUSHYN
CLS
SET MFACPUSHYN=
SET /P MFACPUSHYN=Type Y to push the edited build.prop or n to return to menu and abort:%=%
IF /I "%MFACPUSHYN%"=="Y" GOTO PROPADBPUSH
IF /I "%MFACPUSHYN%"=="N" GOTO PROPOPS
IF  "%MFACPUSHYN%"=="" GOTO MFACPUSHYN
IF NOT "%MFACPUSHYN%"=="ControlValue" GOTO MFACPUSHYN
:ANDVCHANGE
CLS
SET PROPADBPULL=ANDV
SET ANDVVAR=
SET /P ANDVVAR=Type Android version text here then press ENTER:%=%
if "%ANDVVAR%"=="" GOTO ANDVCHANGE
GOTO ANDVYN
:ANDVYN
CLS
SET ANDVYN=
SET /P ANDVYN=Type Y to set %ANDVVAR% as Android Version or N to abort:%=%
IF /I "%ANDVYN%"=="Y" GOTO PROPADBPULL
IF /I "%ANDVYN%"=="n" GOTO PROPOPS
IF "%ANDVYN%"=="" GOTO ANDVYN
IF NOT "%ANDVYN%"=="ControlValue" GOTO ANDVYN
:ANDVTEXT
FINDSTR /v ro.build.version.release=* files\build.prop >files\new.prop
DEL files\build.prop
REN files\new.prop build.prop
ECHO ro.build.version.release=%ANDVVAR% >>files\build.prop
GOTO ANDVPUSHYN
:ANDVPUSHYN
CLS
SET ANDVPUSHYN=
SET /P ANDVPUSHYN=Type Y to push the edited build.prop or n to return to menu and abort:%=%
IF /I "%ANDVPUSHYN%"=="Y" GOTO PROPADBPUSH
IF /I "%ANDVPUSHYN%"=="N" GOTO PROPOPS
IF  "%ANDVPUSHYN%"=="" GOTO ANDVPUSHYN
IF NOT "%ANDVPUSHYN%"=="ControlValue" GOTO ANDVPUSHYN
:MODVCHANGE
CLS
SET PROPADBPULL=MODV
SET MODVVAR=
SET /P MODVVAR=Type mod version text here then press ENTER:%=%
if "%MODVVAR%"=="" GOTO MODVCHANGE
GOTO MODVYN
:MODVYN
CLS
SET MODVYN=
SET /P MODVYN=Type Y to set %MODVVAR% as Mod Version or N to abort:%=%
IF /I "%MODVYN%"=="Y" GOTO PROPADBPULL
IF /I "%MODVYN%"=="n" GOTO PROPOPS
IF "%MODVYN%"=="" GOTO MODVYN
IF NOT "%MODVYN%"=="ControlValue" GOTO MODVYN
:MODVTEXT
FINDSTR /v ro.modversion=* files\build.prop >files\new.prop
DEL files\build.prop
REN files\new.prop build.prop
ECHO ro.modversion=%MODVVAR% >>files\build.prop
GOTO MODVPUSHYN
:MODVPUSHYN
CLS
SET MODVPUSHYN=
SET /P MODVPUSHYN=Type Y to push the edited build.prop or n to return to menu and abort:%=%
IF /I "%MODVPUSHYN%"=="Y" GOTO PROPADBPUSH
IF /I "%MODVPUSHYN%"=="N" GOTO PROPOPS
IF  "%MODVPUSHYN%"=="" GOTO MODVPUSHYN
IF NOT "%MODVPUSHYN%"=="ControlValue" GOTO MODVPUSHYN
:JITWARNING
CLS
ECHO.
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
ECHO Warning this affects you ROM and could cause instability.
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
ECHO.
SET JITOFFYN=
Set /P JITOFFYN=Do you Wish to continue, Y for yes and N for no:%=%
IF /I "%JITOFFYN%"=="Y" GOTO JITCHANGE
IF /I "%JITOFFYN%"=="n" GOTO PROPOPS
IF "%JITOFFYN%"=="" GOTO JITWARNING
IF NOT "%JITOFFYN%"=="ControlValue" GOTO JITWARNING
:JITCHANGE
CLS
SET PROPADBPULL=JIT
GOTO PROPADBPULL
:JITTEXT
FINDSTR dalvik.vm.execution-mode=int:jit files\build.prop >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO NOTTHISONEJIT
FINDSTR /V dalvik.vm.execution-mode=int:jit files\build.prop >files\new.prop
DEL files\build.prop
REN files\new.prop build.prop
ECHO dalvik.vm.execution-mode=int:fast >>files\build.prop
GOTO JITPUSHYN
:JITPUSHYN
CLS
SET JITPUSHYN=
SET /P JITPUSHYN=Type Y to push the edited build.prop (and turn JIT off) or n to return to menu and abort:%=%
IF /I "%JITPUSHYN%"=="Y" GOTO PROPADBPUSH
IF /I "%JITPUSHYN%"=="N" GOTO PROPOPS
IF  "%JITPUSHYN%"=="" GOTO JITPUSHYN
IF NOT "%JITPUSHYN%"=="ControlValue" GOTO JITPUSHYN
:NOTTHISONEJIT
ECHO Unable to turn JIT off in this Rom
ECHO This could be because JIT is already off, isn't in this ROM, or the switch to turn it off wasn't in build.prop
PAUSE
GOTO PROPOPS
:JITWARNINGON
CLS
ECHO.
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
ECHO Warning this affects you ROM and could cause instability.
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
ECHO.
SET JITONYN=
Set /P JITONYN=Do you Wish to continue, Y for yes and N for no:%=%
IF /I "%JITONYN%"=="Y" GOTO JITCHANGEON
IF /I "%JITONYN%"=="n" GOTO PROPOPS
IF "%JITONYN%"=="" GOTO JITWARNINGON
IF NOT "%JITONYN%"=="ControlValue" GOTO JITWARNINGON
:JITCHANGEON
CLS
SET PROPADBPULL=JITON
GOTO PROPADBPULL
:JITONTEXT
FINDSTR dalvik.vm.execution-mode=int:fast Files\build.prop >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO NOTTHISONEJITON
FINDSTR /V dalvik.vm.execution-mode=int:fast files\build.prop >files\new.prop
DEL files\build.prop
REN files\new.prop build.prop
ECHO dalvik.vm.execution-mode=int:jit >>files\build.prop
GOTO JITPUSHYNON
:JITPUSHYNON
CLS
SET JITPUSHYNON=
SET /P JITPUSHYNON=Type Y to push the edited build.prop (and turn JIT off) or N to return to menu and abort:%=%
IF /I "%JITPUSHYNON%"=="Y" GOTO PROPADBPUSH
IF /I "%JITPUSHYNON%"=="N" GOTO PROPOPS
IF  "%JITPUSHYNON%"=="" GOTO JITPUSHYN
IF NOT "%JITPUSHYNON%"=="ControlValue" GOTO JITPUSHYN
:NOTTHISONEJITON
CLS
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
ECHO Unable to turn JIT on in this Rom
ECHO This could be because JIT is already on, isn't in this ROM, or the switch to turn it off wasn't in build.prop
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
PAUSE
GOTO PROPOPS
:PROPBACK
CLS
ECHO.
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
ECHO From this menu you can backup and restore your build.prop
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
ECHO.
ECHO 1 - BackUp Build.prop
ECHO 2 - Restore BackUp
ECHO 3 - Return to Menu
ECHO 4 - Reboot
ECHO 5 - Reboot Recovery
SET PROPBACK=
SET /P PROPBACK=Type choice number then press ENTER:%=%
IF /I "%PROPBACK%"=="1" GOTO PROPBACKPULL
IF /I "%PROPBACK%"=="2" GOTO PROPBACKPUSH
IF /I "%PROPBACK%"=="3" GOTO PROPOPS
IF /I "%PROPBACK%"=="4" GOTO BACKREBOOT
IF /I "%PROPBACK%"=="5" GOTO BACKREBOOTRECOVERY
IF "%PROPBACK%"=="" GOTO PROPBACK
IF NOT "%PROPBACK%"=="ControlValue" GOTO PROPBACK
EXIT
:PROPBACKPULL
CLS
IF EXIST files\backups\buildbak.prop DEL files\backups\buildbak.prop
files\adb pull /system/build.prop >NUL 2>&1
move build.prop files\backups\buildbak.prop
IF exist files\backups\buildbak.prop (
ECHO build.prop succesfully backed up
) ELSE (
GOTO BACKFAIL
)
Pause
GOTO :PROPBACK
:PROPBACKPUSH
CLS
files\adb shell mount -o rw,remount /dev/block/mtdblock3 /system >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO RESTOREPROPFAIL
files\adb push files\backups\buildbak.prop /system/build.prop >NUL 2>&1
IF "%ERRORLEVEL%"=="1" (
GOTO RESTOREPROPFAIL
) ELSE (
ECHO Succesfully restored
)
PAUSE
GOTO BACKREBOOTORNO
:BACKREBOOTORNO
CLS
ECHO The files have been pushed, in order for them to take effect you need to reboot
SET BACKREBOOTYN=
SET /P BACKREBOOTYN=Type r to reboot or n to return to menu reboot later:%=%
IF /I "%BACKREBOOTYN%"=="r" GOTO BACKREBOOT
IF /I "%BACKREBOOTYN%"=="n" GOTO PROPBACK
IF "%BACKREBOOTYN%"=="" GOTO BACKREBOOTORNO
IF NOT "%BACKREBOOTYN%"=="ControlValue" GOTO BACKREBOOTORNO
:BACKREBOOT
files\adb reboot >NUL 2>&1
IF "%ERRORLEVEL%"=="1" (
GOTO BACKFAIL
) ELSE (
GOTO PROPBACK
)
:BACKREBOOTRECOVERY
files\adb reboot recovery >NUL 2>&1
IF "%ERRORLEVEL%"=="1" (
GOTO BACKFAIL
) ELSE (
GOTO PROPBACK
)
:BACKFAIL
CLS
ECHO.
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
ECHO Unable to Backup, most likely do to phone being unplugged, or usb debugging not checked on
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
PAUSE
GOTO PROPBACK
:RESTOREBACKFAIL
CLS
ECHO.
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
ECHO Unable to restore build.prop, most likely do to phone being unplugged, or usb debugging not checked on
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
PAUSE
GOTO PROPBACK
:BOOTOPS
CLS
ECHO.
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
ECHO From this menu you can backup, restore, and flash boot animations
ECHO In order to flash them they need to be in the BootAniGoesHere
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
ECHO.
ECHO 1 - BackUp BootAni
ECHO 2 - Restore BackUp
ECHO 3 - Flash BootAni
ECHO 4 - Flash Example BootAni's
ECHO 5 - Reboot
ECHO 6 - Reboot Recovery
ECHO 7 - Return to Menu
SET BOOTOP=
SET /P BOOTOP=Type choice number then press ENTER:%=%
IF /I "%BOOTOP%"=="1" GOTO BOOTBACKPULL
IF /I "%BOOTOP%"=="2" GOTO BOOTBACKPUSH
IF /I "%BOOTOP%"=="3" GOTO BOOTFLASH
IF /I "%BOOTOP%"=="4" GOTO BOOTEXFLASH
IF /I "%BOOTOP%"=="5" GOTO BOOTREBOOT
IF /I "%BOOTOP%"=="6" GOTO BOOTREBOOTR
IF /I "%BOOTOP%"=="7" GOTO MENU
IF "%BOOTOP%"=="" GOTO BOOTOPS
IF NOT "%BOOTOP%"=="ControlValue" GOTO BOOTOPS
:BOOTBACKPULL
CLS
files\adb pull /system/media/bootanimation.zip >NUL 2>&1
move bootanimation.zip files\backups\bootbak.zip
IF exist files\backups\bootbak.zip (
ECHO BootAni succesfully backed up
) ELSE (
GOTO BOOTBOOTBACKFAIL
)
Pause
GOTO BOOTOPS
:BOOTBACKPUSH
CLS
files\adb shell mount -o rw,remount /dev/block/mtdblock3 /system
IF "%ERRORLEVEL%"=="1" GOTO RESTOREPBOOTBACKFAIL
files\adb shell rm -r /data/local/bootscreen >NUL 2>&1
files\adb shell rm -r /system/media/bootscreen>NUL 2>&1
files\adb push files\backups\bootbak.zip /data/local/bootanimation.zip >NUL 2>&1 &%files\adb push files\backups\bootbak.zip /system/media/bootanimation.zip>NUL 2>&1
IF "%ERRORLEVEL%"=="1" (
GOTO RESTOREPBOOTBACKFAIL
) ELSE (
ECHO Succesfully backed up
)
PAUSE
GOTO BOOTOPS
:BOOTBACKREBOOTORNO
CLS
ECHO The files have been pushed, in order for you to see them you need to reboot
SET BOOTBACKREBOOTYN=
SET /P BOOTBACKREBOOTYN=Type r to reboot or n to return to menu reboot later:%=%
IF /I "%BOOTBACKREBOOTYN%"=="r" GOTO BOOTREBOOT
IF /I "%BOOTBACKREBOOTYN%"=="n" GOTO BOOTOPS
IF "%BOOTBACKREBOOTYN%"=="" GOTO BOOTBACKREBOOTORNO
IF NOT "%BOOTBACKREBOOTYN%"=="ControlValue" GOTO BOOTBACKREBOOTORNO
:BOOTREBOOT
files\adb reboot >NUL 2>&1
IF "%ERRORLEVEL%"=="1" (
GOTO BOOTBACKFAIL
) ELSE (
GOTO BOOTOPS
)
:BACKREBOOTRECOVERY
files\adb reboot recovery >NUL 2>&1
IF "%ERRORLEVEL%"=="1" (
GOTO BOOTBACKFAIL
) ELSE (
GOTO BOOTOPS
)
:BOOTBACKFAIL
CLS
ECHO.
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
ECHO Unable to Backup BootAni, most likely do to phone being unplugged, or usb debugging not checked on
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
PAUSE
GOTO BOOTOPS
:RESTOREBOOTBACKFAIL
CLS
ECHO.
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
ECHO Unable to restore BootAni, most likely do to phone being unplugged, or usb debugging not checked on
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
PAUSE
GOTO BOOTOPS
:BOOTFLASH
files\adb shell mount -o rw,remount /dev/block/mtdblock3 /system >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO BOOTFLASHFAIL
files\adb shell rm -r /data/local/bootscreen >NUL 2>&1
files\adb shell rm -r /system/media/bootscreen>NUL 2>&1
REN bootanigoeshere\*.zip bootanimation.zip
files\adb push bootanigoeshere\bootanimation.zip /system/media/bootanimation.zip >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO BOOTFLASHFAIL
files\adb push bootanigoeshere\bootanimation.zip /data/local/bootanimation.zip >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO BOOTFLASHFAIL
GOTO BOOTBACKREBOOTORNO
:BOOTFLASHFAIL
CLS
ECHO.
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
ECHO Unable to flash BootAni, most likely do to phone being unplugged, or usb debugging not checked on.
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
PAUSE
GOTO BOOTOPS
:BOOTEXFLASH
CLS
ECHO.
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
ECHO From this menu you can flash the example boot animations included. 
ECHO Note: These were NOT created by me
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
ECHO.
ECHO 1 - Android V Apple (Potentially NSFW)
ECHO 2 - Bios
ECHO 3 - CYANOGEN
ECHO 4 - DROID
ECHO 5 - Matrix
ECHO 6 - Mario
ECHO 7 - 2.1 Stock
ECHO 8 - Return to Menu
SET FLASHEX=
SET /P FLASHEX=Type choice number then press ENTER:%=%
IF /I "%FLASHEX%"=="1" GOTO ANDFLASH
IF /I "%FLASHEX%"=="2" GOTO BIOSFLASH
IF /I "%FLASHEX%"=="3" GOTO CYANFLASH
IF /I "%FLASHEX%"=="4" GOTO DROIDFLASH
IF /I "%FLASHEX%"=="5" GOTO MATRIXFLASH
IF /I "%FLASHEX%"=="6" GOTO MARIOFLASH
IF /I "%FLASHEX%"=="8" GOTO BOOTOPS
IF /I "%FLASHEX%"=="7" GOTO 2.1STOCKFLASH
IF "%FLASHEX%"=="" GOTO BOOTEXFLASH
IF NOT "%FLASHEX%"=="ControlValue" GOTO BOOTEXFLASH
:ANDFLASH
files\adb shell mount -o rw,remount /dev/block/mtdblock3 /system
IF "%ERRORLEVEL%"=="1" GOTO BOOTFLASHFAIL
files\adb shell rm -r /data/local/bootscreen >NUL 2>&1
files\adb shell rm -r /system/media/bootscreen>NUL 2>&1
files\adb push files\BootEx\ApplewAndroid\bootanimation.zip /system/media/bootanimation.zip >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO BOOTFLASHFAIL
files\adb push files\BootEx\ApplewAndroid\bootanimation.zip /data/local/bootanimation.zip >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO BOOTFLASHFAIL
GOTO BOOTBACKREBOOTORNO
:BIOSFLASH
files\adb shell mount -o rw,remount /dev/block/mtdblock3 /system >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO BOOTFLASHFAIL
files\adb shell rm -r /data/local/bootscreen >NUL 2>&1
files\adb shell rm -r /system/media/bootscreen>NUL 2>&1
files\adb push files\BootEx\BIOS\bootanimation.zip /system/media/bootanimation.zip >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO BOOTFLASHFAIL
files\adb push files\BootEx\BIOS\bootanimation.zip /data/local/bootanimation.zip >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO BOOTFLASHFAIL
GOTO BOOTBACKREBOOTORNO
:CYANFLASH
files\adb shell mount -o rw,remount /dev/block/mtdblock3 /system >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO BOOTFLASHFAIL
files\adb shell rm -r /data/local/bootscreen>NUL 2>&1
files\adb shell rm -r /system/media/bootscreen>NUL 2>&1
files\adb push files\BootEx\cyanogen\bootanimation.zip /system/media/bootanimation.zip >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO BOOTFLASHFAIL
files\adb push files\BootEx\cyanogen\bootanimation.zip /data/local/bootanimation.zip >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO BOOTFLASHFAIL
GOTO BOOTBACKREBOOTORNO
:DROIDFLASH
files\adb shell mount -o rw,remount /dev/block/mtdblock3 /system >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO BOOTFLASHFAIL
files\adb shell rm -r /data/local/bootscreen>NUL 2>&1
files\adb shell rm -r /system/media/bootscreen>NUL 2>&1
files\adb push files\BootEx\DroidOriginal\bootanimation.zip /system/media/bootanimation.zip >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO BOOTFLASHFAIL
files\adb push files\BootEx\DroidOriginal\bootanimation.zip /data/local/bootanimation.zip >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO BOOTFLASHFAIL
GOTO BOOTBACKREBOOTORNO
:MATRIXFLASH
files\adb shell mount -o rw,remount /dev/block/mtdblock3 /system >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO BOOTFLASHFAIL
files\adb shell rm -r /data/local/bootscreen>NUL 2>&1
files\adb shell rm -r /system/media/bootscreen>NUL 2>&1
files\adb push files\BootEx\Matrix\bootanimation.zip /system/media/bootanimation.zip >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO BOOTFLASHFAIL
files\adb push files\BootEx\Matrix\bootanimation.zip /data/local/bootanimation.zip >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO BOOTFLASHFAIL
GOTO BOOTBACKREBOOTORNO
:MARIOFLASH
files\adb shell mount -o rw,remount /dev/block/mtdblock3 /system >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO BOOTFLASHFAIL
files\adb shell rm -r /data/local/bootscreen>NUL 2>&1
files\adb shell rm -r /system/media/bootscreen>NUL 2>&1
files\adb push files\BootEx\SuperMario\bootanimation.zip /system/media/bootanimation.zip >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO BOOTFLASHFAIL
files\adb push files\BootEx\SuperMario\bootanimation.zip /data/local/bootanimation.zip >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO BOOTFLASHFAIL
GOTO BOOTBACKREBOOTORNO
:2.1STOCKFLASH
files\adb shell mount -o rw,remount /dev/block/mtdblock3 /system >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO BOOTFLASHFAIL
files\adb shell rm -r /data/local/bootscreen>NUL 2>&1
files\adb shell rm -r /system/media/bootscreen>NUL 2>&1
files\adb push files\BootEx\2.1stock\bootanimation.zip /system/media/bootanimation.zip >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO BOOTFLASHFAIL
files\adb push files\BootEx\2.1stock\bootanimation.zip /data/local/bootanimation.zip >NUL 2>&1
IF "%ERRORLEVEL%"=="1" GOTO BOOTFLASHFAIL
GOTO BOOTBACKREBOOTORNO
:SIGN
CLS
SET SIGNPATH=
SET /P SIGNPATH=Type path to file that you wish to sign or n to reurn to menu and abort:%=%
IF /I "%SIGNPATH%"=="n" GOTO MENU
IF "%SIGNPATH%"=="" GOTO SIGN
IF exist %SIGNPATH% (
GOTO SIGNYN
) ELSE (
ECHO file not found!
)
ECHO.
ECHO Make sure you are typing the full path to the file
ECHO.
PAUSE
GOTO SIGN
:SIGNYN
CLS
SET SIGNYN=
ECHO File to sign is %SIGNPATH%
SET /P SIGNYN=Do you wish to proceed and sign? Y to continue and sign or N to return to menu:
IF /I "%SIGNYN%"=="y" GOTO SIGNJAVA
IF /I "%SIGNYN%"=="n" GOTO MENU
IF "%SIGNYN%"=="" GOTO SIGNYN
IF NOT "%SIGNYN%"=="ControlValue" GOTO SIGNYN
)
:SIGNJAVA
CD files
java testsign %SIGNPATH%>NUL 2>&1
IF %errorlevel%==1 (
GOTO SIGNFAIL
) ELSE (
GOTO SIGNSUCCESS
)
:SIGNFAIL
CD ..
CLS
ECHO.
ECHO ERROR!
ECHO.
ECHO Unable to sign!
Pause
GOTO MENU
:SIGNSUCCESS
CD ..
CLS
ECHO.
ECHO File was signed Succesfully!
ECHO.
PAUSE
GOTO MENU
:ALTSIGN
CLS
SET ALTSIGNPATH=
SET /P ALTSIGNPATH=Type path to file that you wish to sign or n to reurn to menu and abort:%=%
IF /I "%ALTSIGNPATH%"=="n" GOTO MENU
IF "%ALTSIGNPATH%"=="" GOTO ALTSIGN
IF exist %ALTSIGNPATH% (
GOTO ALTSIGNYN
) ELSE (
ECHO file not found!
)
ECHO.
ECHO Make sure you are typing the full path to the file
ECHO.
PAUSE
GOTO ALTSIGN
:ALTSIGNYN
CLS
SET ALTSIGNYN=
ECHO File to sign is %ALTSIGNPATH%
SET /P ALTSIGNYN=Do you wish to proceed and sign? Y to continue and sign or N to return to menu:
IF /I "%ALTSIGNYN%"=="y" GOTO ALTSIGNJAVA
IF /I "%ALTSIGNYN%"=="n" GOTO MENU
IF "%ALTSIGNYN%"=="" GOTO ALTSIGNYN
IF NOT "%ALTSIGNYN%"=="ControlValue" GOTO ALTSIGNYN
:ALTSIGNJAVA
CD files
java -classpath testsign.jar testsign %ALTSIGNPATH%>NUL 2>&1
IF %errorlevel%==1 (
GOTO ALTSIGNFAIL
) ELSE (
GOTO ALTSIGNSUCCESS
)
:ALTSIGNFAIL
CD ..
CLS
ECHO.
ECHO ERROR!
ECHO.
ECHO Unable to sign
Pause
GOTO MENU
:ALTSIGNSUCCESS
CD ..
CLS
ECHO.
ECHO File was signed Succesfully!
ECHO.
PAUSE
GOTO MENU
:FONTMENUSET
CD FILES || GOTO MENUSET
GOTO FONTMENU
:FONTMENU
CLS
ECHO.
ECHO *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
ECHO Press the number that corresponds with the option you want.
ECHO Place your boot animation in the FilesGoHERE folder
ECHO No need to rename it, just drop a copy of it in that Folder.
ECHO For the Fonts Place them in the FONTSHERE folder.
ECHO Make sure you Make A backup of the orginal Fonts so 
ECHO you can restore them with option 7.
ECHO *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
ECHO.
ECHO 1 - BackUp Fonts from phone
ECHO 2 - Flash Fonts
ECHO 3 - Restore Fonts From Your Backup
ECHO 4 - Return to main menu
ECHO.
SET M=
SET /P M=Type 1, 2, 3, or 4 then press ENTER:%=%
IF "%M%"=="1" GOTO FONTBACK
IF "%M%"=="2" GOTO FONTF
IF "%M%"=="3" GOTO RESTORE
IF "%M%"=="4" GOTO MENUSET
IF ""%M%""=="" GOTO FONTMENU
IF NOT ""%M%""=="ControlValue" GOTO FONTMENU
:RESTORE
CLS
ECHO In order to flash the backups, you must have made a backup with the "BackUP Fonts from Phone" Option.
SET H=
SET /P H=Type Y if you made a backup of the Fonts, otherwise Press n, then ENTER:%=%
IF /I "%H%"=="Y" GOTO CONT
IF /I "%H%"=="N" GOTO FONTMENU
IF ""%H%""=="" GOTO RESTORE
IF NOT ""%H%""=="ControlValue" GOTO RESTORE
:CONT
adb shell mount -o rw,remount /dev/block/mtdblock3 /system
adb push FontBackups /system/fonts
ECHO Your phone has has been flashed with the fonts you backed up.
ECHO Rebooting now...
adb reboot
pause
GOTO FONTMENU
:FONTF
CLS
ECHO.
ECHO *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-**-*-*-*-*-*-*-*-*-*-*-*-*-
ECHO In this menu You can flash some of the Fonts I have 
ECHO provided Or you can flash Fonts that you  have found.
ECHO Choose on of the Options and follow the On Screen Directions.
ECHO *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-**-*-*-*-*-*-*-*-*-*-*-*-*-
ECHO.
ECHO 1 - Flash Examples
ECHO 2 - Flash Your Own Font
ECHO 3 - Return to Font Menu
SET T=
SET /P T=Type 1, 2, or 3, then press ENTER:%+%
IF "%T%"=="1" GOTO EXAMPLES
IF "%T%"=="2" GOTO USERFONT
IF "%T%"=="3" GOTO FONTMENU
IF "%T%"=="" GOTO FONTF
IF NOT "%T%"=="ControlValue"
:EXAMPLES
CLS
ECHO *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-**-*-*-*-*-*-*-*-*-*-*-*-*-
ECHO Choose the number that corresponds with the Font you 
ECHO want to Flash. There are pictures Of each Font in the 
ECHO files folder.
ECHO *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-**-*-*-*-*-*-*-*-*-*-*-*-*-
ECHO.
ECHO 1 - Apple Garamond
ECHO 2 - Apple Garamond Bold
ECHO 3 - Bonzai 
ECHO 4 - Broadway
ECHO 5 - Cartoon
ECHO 6 - Chancery
ECHO 7 - Comic Sans
ECHO 8 - Corsiva
ECHO 9 - Courier New
ECHO 10 - Demonized
ECHO 11 - Droid Logo
ECHO 12 - Exile
ECHO 13 - Final Frontier
ECHO 14 - Halo
ECHO 15 - Harrington
ECHO 16 - Ming
ECHO 17 - Rehearsal Curve
ECHO 18 - Rehearsal Offset
ECHO 19 - Russel Square
ECHO 20 - Segoe
ECHO 21 - Techniczna
ECHO 22 - Standard Fonts
ECHO 23 - Go to Main Menu
SET F=
SET /P F=Type the # that Corresponds with the Font You want then press ENTER:%=%
IF "%F%"=="1" GOTO F1
IF "%F%"=="2" Goto F2
IF "%F%"=="3" GOTO F3
IF "%F%"=="4" Goto F4
IF "%F%"=="5" GOTO F5
IF "%F%"=="6" GOTO F6
IF "%F%"=="7" GOTO F7
IF "%F%"=="8" GOTO F8
IF "%F%"=="9" GOTO F9
IF "%F%"=="10" GOTO F10
IF "%F%"=="11" GOTO F11
IF "%F%"=="12" Goto F12
IF "%F%"=="13" GOTO F13
IF "%F%"=="14" GOTO F14
IF "%F%"=="15" GOTO F15
IF "%F%"=="16" GOTO F16
IF "%F%"=="17" GOTO F17
IF "%F%"=="18" GOTO F18
IF "%F%"=="19" GOTO F19
IF "%F%"=="20" GOTO F20
IF "%F%"=="21" GOTO F21
IF "%F%"=="22" GOTO F22
IF "%F%"=="23" GOTO FONTMENU
IF "%F%"=="" GOTO EXAMPLES
IF NOT "%F%"=="ControlValue" GOTO EXAMPLES
:F1
CLS
adb shell mount -o rw,remount /dev/block/mtdblock3 /system>NUL 2>&1 ||GOTO ADBFAILFONT
adb push FontExamples/Apple_Garamond /system/fonts>NUL 2>&1 ||GOTO ADBFAILFONT
ECHO Apple Garamond Has been Copied to Your Phone now It needs 
ECHO To be rebooted to take effect
adb reboot ||GOTO ADBFAILFONT
CLS
ECHO You will now be taken to the Font Menu.
PAUSE
GOTO FONTMENU
:F2
CLS
adb shell mount -o rw,remount /dev/block/mtdblock3 /system>NUL 2>&1 ||GOTO ADBFAILFONT
adb push FontExamples/Apple_Garamond-BoldItalic /system/fonts>NUL 2>&1 ||GOTO ADBFAILFONT
ECHO Apple Garamond Bold Has been Copied to your Phone, now it needs to 
ECHO Rebooted To take effect.
adb reboot ||GOTO ADBFAILFONT
CLS
ECHO You will now be taken to the Font Menu.
PAUSE
GOTO FONTMENU
:F3
CLS
adb shell mount -o rw,remount /dev/block/mtdblock3 /system>NUL 2>&1 ||GOTO ADBFAILFONT
adb push FontExamples/Bonzai /system/fonts>NUL 2>&1 ||GOTO ADBFAILFONT
ECHO Bonzai Has been Copied to your Phone, now it needs to 
ECHO Rebooted To take effect.
adb reboot ||GOTO ADBFAILFONT
CLS
ECHO You will now be taken to the Font Menu.
PAUSE
GOTO FONTMENU
:F4
CLS
adb shell mount -o rw,remount /dev/block/mtdblock3 /system>NUL 2>&1 ||GOTO ADBFAILFONT
adb push FontExamples/Broadway /system/fonts>NUL 2>&1 ||GOTO ADBFAILFONT
ECHO Broadway Has been Copied to your Phone, now it needs to 
ECHO Rebooted To take effect.
adb reboot ||GOTO ADBFAILFONT
CLS
ECHO You will now be taken to the Font Menu.
PAUSE
GOTO FONTMENU
:F5
CLS
adb shell mount -o rw,remount /dev/block/mtdblock3 /system>NUL 2>&1 ||GOTO ADBFAILFONT
adb push FontExamples/Cartoon /system/fonts>NUL 2>&1 ||GOTO ADBFAILFONT
ECHO Cartoon Has been Copied to your Phone, now it needs to 
ECHO Rebooted To take effect.
adb reboot ||GOTO ADBFAILFONT
CLS
ECHO You will now be taken to the Font Menu.
PAUSE
GOTO FONTMENU
:F6
CLS
adb shell mount -o rw,remount /dev/block/mtdblock3 /system>NUL 2>&1 ||GOTO ADBFAILFONT
adb push FontExamples/Chancery /system/fonts>NUL 2>&1 ||GOTO ADBFAILFONT
ECHO Chancery Has been Copied to your Phone, now it needs to 
ECHO Rebooted To take effect.
adb reboot ||GOTO ADBFAILFONT
CLS
ECHO You will now be taken to the Font Menu.
PAUSE
GOTO FONTMENU
:F7
CLS
adb shell mount -o rw,remount /dev/block/mtdblock3 /system>NUL 2>&1 ||GOTO ADBFAILFONT
adb push FontExamples/Comic_Sans /system/fonts>NUL 2>&1 ||GOTO ADBFAILFONT
ECHO Comic Sans Has been Copied to your Phone, now it needs to 
ECHO Rebooted To take effect.
adb reboot ||GOTO ADBFAILFONT
CLS
ECHO You will now be taken to the Font Menu.
PAUSE
GOTO FONTMENU
:F8
CLS
adb shell mount -o rw,remount /dev/block/mtdblock3 /system>NUL 2>&1 ||GOTO ADBFAILFONT
adb push FontExamples/Corsiva /system/fonts>NUL 2>&1 ||GOTO ADBFAILFONT
ECHO Corsiva Has been Copied to your Phone, now it needs to 
ECHO Rebooted To take effect.
adb reboot ||GOTO ADBFAILFONT
CLS
ECHO You will now be taken to the Font Menu.
PAUSE
GOTO FONTMENU
:F9
CLS
adb shell mount -o rw,remount /dev/block/mtdblock3 /system>NUL 2>&1 ||GOTO ADBFAILFONT
adb push FontExamples/Courier_New /system/fonts>NUL 2>&1 ||GOTO ADBFAILFONT
ECHO Courier New Has been Copied to your Phone, now it needs to 
ECHO Rebooted To take effect.
adb reboot ||GOTO ADBFAILFONT
CLS
ECHO You will now be taken to the Font Menu.
PAUSE
GOTO FONTMENU
:F10
CLS
adb shell mount -o rw,remount /dev/block/mtdblock3 /system>NUL 2>&1 ||GOTO ADBFAILFONT
adb push FontExamples/Demonized /system/fonts>NUL 2>&1 ||GOTO ADBFAILFONT
ECHO Demonized Has been Copied to your Phone, now it needs to 
ECHO Rebooted To take effect.
adb reboot ||GOTO ADBFAILFONT
CLS
ECHO You will now be taken to the Font Menu.
PAUSE
GOTO FONTMENU
:F11
CLS
adb shell mount -o rw,remount /dev/block/mtdblock3 /system>NUL 2>&1 ||GOTO ADBFAILFONT
adb push FontExamples/Droid_Logo /system/fonts>NUL 2>&1 ||GOTO ADBFAILFONT
ECHO Droid Logo Has been Copied to your Phone, now it needs to 
ECHO Rebooted To take effect.
adb reboot ||GOTO ADBFAILFONT
CLS
ECHO You will now be taken to the Font Menu.
PAUSE
GOTO FONTMENU
:F12
CLS
adb shell mount -o rw,remount /dev/block/mtdblock3 /system>NUL 2>&1 ||GOTO ADBFAILFONT
adb push FontExamples/Exile /system/fonts>NUL 2>&1 ||GOTO ADBFAILFONT
ECHO Exile Has been Copied to your Phone, now it needs to 
ECHO Rebooted To take effect.
adb reboot ||GOTO ADBFAILFONT
CLS
ECHO You will now be taken to the Font Menu.
PAUSE
GOTO FONTMENU
:F13
CLS
adb shell mount -o rw,remount /dev/block/mtdblock3 /system>NUL 2>&1 ||GOTO ADBFAILFONT
adb push FontExamples/Final_Frontier /system/fonts>NUL 2>&1 ||GOTO ADBFAILFONT
ECHO Final Frontier Has been Copied to your Phone, now it needs to 
ECHO Rebooted To take effect.
adb reboot ||GOTO ADBFAILFONT
CLS
ECHO You will now be taken to the Font Menu.
PAUSE
GOTO FONTMENU
:F14
CLS
adb shell mount -o rw,remount /dev/block/mtdblock3 /system>NUL 2>&1 ||GOTO ADBFAILFONT
adb push FontExamples/Halo /system/fonts>NUL 2>&1 ||GOTO ADBFAILFONT
ECHO Halo Has been Copied to your Phone, now it needs to 
ECHO Rebooted To take effect.
adb reboot ||GOTO ADBFAILFONT
CLS
ECHO You will now be taken to the Font Menu.
PAUSE
GOTO FONTMENU
:F15
CLS
adb shell mount -o rw,remount /dev/block/mtdblock3 /system>NUL 2>&1 ||GOTO ADBFAILFONT
adb push FontExamples/Harrington /system/fonts>NUL 2>&1 ||GOTO ADBFAILFONT
ECHO Harrington Has been Copied to your Phone, now it needs to 
ECHO Rebooted To take effect.
adb reboot ||GOTO ADBFAILFONT
CLS
ECHO You will now be taken to the Font Menu.
PAUSE
GOTO FONTMENU
:F16
CLS
adb shell mount -o rw,remount /dev/block/mtdblock3 /system>NUL 2>&1 ||GOTO ADBFAILFONT
adb push FontExamples/Ming /system/fonts>NUL 2>&1 ||GOTO ADBFAILFONT
ECHO Ming Has been Copied to your Phone, now it needs to 
ECHO Rebooted To take effect.
adb reboot ||GOTO ADBFAILFONT
CLS
ECHO You will now be taken to the Font Menu.
PAUSE
GOTO FONTMENU
:F17
CLS
adb shell mount -o rw,remount /dev/block/mtdblock3 /system>NUL 2>&1 ||GOTO ADBFAILFONT
adb push FontExamples/Rehearsal_Curve /system/fonts>NUL 2>&1 ||GOTO ADBFAILFONT
ECHO Rehearsal Curve Has been Copied to your Phone, now it needs to 
ECHO Rebooted To take effect.
adb reboot ||GOTO ADBFAILFONT
CLS
ECHO You will now be taken to the Font Menu.
PAUSE
GOTO FONTMENU
:F18
CLS
adb shell mount -o rw,remount /dev/block/mtdblock3 /system>NUL 2>&1 ||GOTO ADBFAILFONT
adb push FontExamples/Rehearsal_Offset /system/fonts>NUL 2>&1 ||GOTO ADBFAILFONT
ECHO Rehearsal Offset Has been Copied to your Phone, now it needs to 
ECHO Rebooted To take effect.
adb reboot ||GOTO ADBFAILFONT
CLS
ECHO You will now be taken to the Font Menu.
PAUSE
GOTO FONTMENU
:F19
CLS
adb shell mount -o rw,remount /dev/block/mtdblock3 /system>NUL 2>&1  ||GOTO ADBFAILFONT
adb push FontExamples/Russel_Square /system/fonts>NUL 2>&1  ||GOTO ADBFAILFONT
ECHO Russel Square Has been Copied to your Phone, now it needs to 
ECHO Rebooted To take effect.
adb reboot ||GOTO ADBFAILFONT
CLS
ECHO You will now be taken to the Font Menu.
PAUSE
GOTO FONTMENU
:F20
CLS
adb shell mount -o rw,remount /dev/block/mtdblock3 /system>NUL 2>&1 ||GOTO ADBFAILFONT
adb push FontExamples/Segoe /system/fonts>NUL 2>&1 ||GOTO ADBFAILFONT
ECHO Segoe Has been Copied to your Phone, now it needs to 
ECHO Rebooted To take effect.
adb reboot ||GOTO ADBFAILFONT
CLS
ECHO You will now be taken to the Font Menu.
PAUSE
GOTO FONTMENU
:F21
CLS
adb shell mount -o rw,remount /dev/block/mtdblock3 /system>NUL 2>&1 ||GOTO ADBFAILFONT
adb push FontExamples/Techniczna /system/fonts>NUL 2>&1 ||GOTO ADBFAILFONT
ECHO Techniczna Has been Copied to your Phone, now it needs to 
ECHO Rebooted To take effect.
adb reboot ||GOTO ADBFAILFONT
CLS
ECHO You will now be taken to the Font Menu.
PAUSE
GOTO FONTMENU
:F22
CLS
adb shell mount -o rw,remount /dev/block/mtdblock3 /system>NUL 2>&1 ||GOTO ADBFAILFONT
adb push FontExamples/Stock_Font /system/fonts>NUL 2>&1 ||GOTO ADBFAILFONT
ECHO The Original Fonts have been flashed To your phone.
ECHO Rebooting Now...
adb reboot ||GOTO ADBFAILFONT
CLS
ECHO You will be take to the Main Menu.
PAUSE
GOTO FONTMENU
:USERFONT
CLS 
ECHO *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
ECHO Ok here you have two Options, Flash a simple Font, or 
ECHO Flash the simple font along With the Bold version of the Font.
ECHO *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
ECHO.
SET B=
Set /P B=Type b to flash the Bold Font if you have it or type n for simple Font Flash Meaning No bold Font and press ENTER:%=%
IF /I "%B%"=="b" GOTO USERFONTB
IF "%B%"=="n" GOTO USERFONTN
IF "%B%"=="" GOTO USERFONT
IF NOT "%B%"=="CONTROLVALUE" GOTO USERFONT
:USERFONTN
CLS
adb shell mount -o rw,remount /dev/block/mtdblock3 /system>NUL 2>&1 ||GOTO ADBFAILFONT
cd FontGoesHERE
rename *.ttf DroidSans.ttf
cd ..
adb push FontGoesHERE/DroidSans.ttf /system/fonts/DroidSans.ttf>NUL 2>&1 ||GOTO ADBFAILFONT
ECHO Your Custom Font has been flashed without the Bold Version of the Font
ECHO so The Fonts might not match...
ECHO Your Phone needs to be rebooted for Font to take effect.
adb reboot ||GOTO ADBFAILFONT
CLS
ECHO you will now be take back to the Font Menu.
pause
cd FontGoesHERE
del DroidSans.ttf
cd ..
GOTO FONTMENU

:USERFONTB
CLS
ECHO Make sure you have the Bold version of the Font in the Bold Folder,
ECHO and the regular Font in the FontGoesHERE folder.
pause
adb shell mount -o rw,remount /dev/block/mtdblock3 /system>NUL 2>&1 ||GOTO ADBFAILFONT
cd FontGoesHERE
rename *.ttf DroidSans.ttf
cd ..
adb push FontGoesHERE/DroidSans.ttf /system/fonts/DroidSans.ttf>NUL 2>&1 ||GOTO ADBFAILFONT
cd FontGoesHERE/Bold
rename *.ttf DroidSans-Bold.ttf
cd ..
cd ..
adb push FontGoesHERE/Bold/*.ttf /system/fonts/DroidSans-Bold.ttf ||GOTO ADBFAILFONT>NUL 2>&1
ECHO Your Custom Font has been flashed with the Bold Version of the Font.
ECHO Your Phone needs to be rebooted for Fonts to take effect.
adb reboot ||GOTO ADBFAILFONT
CLS
ECHO You will now be take back to the Font Menu.
pause
cd FontGoesHERE
del *.ttf
cd Bold
del *.ttf
cd ..
cd ..
GOTO FONTMENU
:FONTBACK
adb pull /system/fonts FontBackups>NUL 2>&1 ||GOTO ADBFAILFONT
ECHO Your Fonts Have Been Backed Up
pause
GOTO FONTMENU
:MENUSET
CD ..
GOTO MENU
:ADBFAILFONT
CLS
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
ECHO Unable to interact with the device over adb, ensure it is plugged in and USB debugging is on
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
PAUSE
GOTO FONTMENU
:SPLASHOPS
CLS
ECHO.
ECHO *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
ECHO Put a 320x480 splash.png in the SplashGoesHereFolder
ECHO *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
ECHO.
ECHO 1 - Convert splash.png
ECHO 2 - Flash converted splash
ECHO 3 - Flash Example
ECHO 4 - Reboot
ECHO 5 - Return to Main Menu
ECHO.
SET SF=
SET /P SF=Type 1, 2, 3, or 4 then press ENTER:%=%
IF "%SF%"=="1" GOTO SPLASHMAKE
IF "%SF%"=="2" GOTO SPLASHFLASH
IF "%SF%"=="3" GOTO SPLASHEX
IF "%SF%"=="4" GOTO SPLASHREBOOT
IF "%SF%"=="5" GOTO MENU
IF ""%SF%""=="" GOTO SPLASHOPS
IF NOT ""%SF%""=="ControlValue" GOTO SPLASHOPS
:SPLASHMAKE
IF exist SplashGoesHere\splash.png (
files\convert -depth 8 SplashGoesHere\splash.png rgb:SplashGoesHere\splash.raw ||GOTO FAIL
) ELSE (
GOTO NOTFOUNDSPLASH
)
files\rgb2565.exe < SplashGoesHere\splash.raw > SplashGoesHere\splash.raw565 ||GOTO FAIL
CLS
ECHO File converted choose option 2 to Flash
PAUSE
GOTO SPLASHOPS
:NOTFOUNDSPLASH
CLS
ECHO splash.png not found ensure it is in the SplashGoesHereFolder
PAUSE
GOTO SPLASHOPS
:SPLASHREBOOT
files\adb reboot || GOTO ADBFAILSPLASH
GOTO SPLASHOPS
:FAIL 
CLS
ECHO Unable to convert
PAUSE
GOTO SPLASHOPS
:SPLASHFLASH
files\adb reboot-bootloader || GOTO ADBFAILSPLASH
files\fastboot flash splash1 SplashGoesHere\splash.raw565>NUL 2>&1 || GOTO ADBFAILSPLASH
files\fastboot reboot>NUL 2>&1 || GOTO ADBFAILSPLASH
DEL SplashGoesHere\Splash.*
GOTO SPLASHOPS
:ADBFAILSPLASH
CLS
ECHO Unable to interact with adb or fastboot
PAUSE
GOTO SPLASHOPS
:SPLASHEX
CLS
ECHO.
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
ECHO From this menu you can flash the example splash images included. 
ECHO Note: These were NOT created by me (except for tuxdroid adn r00ts)
ECHO ^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*
ECHO.
ECHO 1 - Eris
ECHO 2 - Slate w/ Outline
ECHO 3 - Orginal
ECHO 4 - Tuxdroid
ECHO 5 - r00ts
ECHO 6 - Return to Menu
ECHO.
SET SFE=
SET /P SFE=Type 1, 2, 3, or 4 then press ENTER:%=%
IF "%SFE%"=="1" GOTO ERISFLASH
IF "%SFE%"=="2" GOTO SLATEFLASH
IF "%SFE%"=="3" GOTO ORIGFLASH
IF "%SFE%"=="4" GOTO TUXFLASH
IF "%SFE%"=="5" GOTO R00TSFLASH
IF "%SFE%"=="6" GOTO SPLASHOPS
IF ""%SFE%""=="" GOTO SPLASHEX
IF NOT ""%SFE%""=="ControlValue" GOTO SPLASHEX
:ERISFLASH
files\adb reboot-bootloader
files\fastboot flash splash1 SplashGoesHere\DroidEris.rgb565>NUL 2>&1 ||GOTO ADBFAILSPLASH
files\fastboot reboot>NUL 2>&1 ||GOTO ADBFAILSPLASH
GOTO SPLASHOPS
:SLATEFLASH
files\adb reboot-bootloader
files\fastboot flash splash1 SplashGoesHere\GreendroidGreyBG.rgb565>NUL 2>&1 ||GOTO ADBFAILSPLASH
files\fastboot reboot>NUL 2>&1 ||GOTO ADBFAILSPLASH
GOTO SPLASHOPS
:ORIGFLASH
files\adb reboot-bootloader
files\fastboot flash splash1 SplashGoesHere\osplash.rgb565>NUL 2>&1 ||GOTO ADBFAILSPLASH
files\fastboot reboot>NUL 2>&1 ||GOTO ADBFAILSPLASH
GOTO SPLASHOPS
:TUXFLASH
files\adb reboot-bootloader
files\fastboot flash splash1 SplashGoesHere\tuxsplash.raw565>NUL 2>&1 ||GOTO ADBFAILSPLASH
files\fastboot reboot>NUL 2>&1 ||GOTO ADBFAILSPLASH
GOTO SPLASHOPS
:R00TSFLASH
files\adb reboot-bootloader
files\fastboot flash splash1 SplashGoesHere\r00ts.raw565>NUL 2>&1 ||GOTO ADBFAILSPLASH
files\fastboot reboot>NUL 2>&1 ||GOTO ADBFAILSPLASH
GOTO SPLASHOPS
