#!/bin/bash
############################################################################################
#               RomCustomizer.sh -by jamezelle (windows version by deman88)                #
#                   Read README included in zip(or tar) before running!                    #
#             Feel free to modify but please do not pass this of as your own               #
############################################################################################

menu(){
echo "^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*"
echo "This progam allows you to customize your ROM it is used at your own risk"
echo "In order to use this program have your phone plugged in and usb"
echo "debugging on."
echo "Options with (X) after them are aesthetic changes only"
echo "Adding sysrw and syro will allow you to mount as read-write and read-only from adb shell and from terminal emulator on the phone"
echo "Editing build.prop allows you to changed a bunch of options that show in Settings > About phone on most roms with JIT it can turn it on and off."
echo "Boot Animation menu allows you to backup and restore BootAni's as well as flash new ones and included examples"
echo "Signing .zips and .apks allows the phone to acccept them such as in update.zips and edited .apks"
echo "^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*^<^>^*"
echo "".
echo "1 - Reboot"
echo "2 - Reboot to Recovery"
echo "3 - Change Carrier Text (Vanilla/CM Roms Only)(X)"
echo "4 - Add sysrw and sysro commands"
echo "5 - Edit build.prop"
echo "6 - Boot Animation Menu"
echo "7 - Sign .zip or .apk (JRE required)"
echo "8 - Sign using alternate method (Only if regular method doesn't work)"
echo "9 - Font Menu"
echo "10 - Splash Menu"
echo "11 - Exit"
echo ""
echo "Type a number then press ENTER: "
read option
}

erradb(){
echo "an error occured while using adb, make sure it is executable!"
}

#global variables
export ADB=`pwd`/files/bin/adb
export FASTBOOT=`pwd`/files/bin/fastboot

#set up files

#check udev for android permission
ls /etc/udev/rules.d/ | grep "android"
if [ $? != 0 ]; then
    echo "you need to setup your udev rules for adb and fastboot"
    echo "check http://developer.android.com/guide/developing/device.html for instructions"
fi  

chmod 755 `pwd`/files/bin/*


#####################################################################
##################### main option functions #########################
#####################################################################
REBOOT() {
#whatever commands for reboot
echo "Really reboot phone [y/n]?"
read BOOLREBOOT
if [ $BOOLREBOOT == "y" ] ; then
    echo "Rebooting your phone..."
    sleep 1
    $ADB shell reboot
fi
if [ $? != 0 ]; then
    erradb
fi
menu
}
REBOOTRECOVERY() {
echo "Really reboot device to recovery [y/n]?"
read BOOLREBOOTRCVY
if [ $BOOLREBOOTRCVY == "y" ] ; then
    echo "Rebooting your phone into recovery..."
    sleep 1
    $ADB shell reboot recovery
fi
if [ $? != 0 ]; then
    erradb
fi
menu
}
SETCARRIERVAR() {

}
ADD() {
echo 4

}
PROPOPS() {
echo 5
}
BOOTOPS() {
echo 6
}
SIGN() {
echo 7
}
ALTSIGN() {
echo 8
}
FONTMENUSET() {
echo 9
}
SPLASHOPS() {
echo 10
}




menu

case $option in 
      1)
        clear
	REBOOT
	;;
      2)
	clear
        REBOOTRECOVERY
        ;;
      3)
	clear
        SETCARRIERVAR
        ;;
      4)
	clear
        ADD
        ;;
      5)
	clear
        PROPOPS
        ;;
      6)
	clear
        BOOTOPS
        ;;
      7)
	clear
        SIGN
        ;;
      8)
	clear
        ALTSIGN
       ;;
      9)
	clear
        FONTMENUSET
        ;;
     10)
	clear
        SPLASHOPS
        ;;
     11)
	exit
	;;
     *)
	clear
	menu
        ;;
esac


