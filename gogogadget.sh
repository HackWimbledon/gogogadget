#!/bin/bash
if [ $# -eq 0 ]
then
        echo "No directory given to gogogadget!"
        exit
fi
EDITDIR=$1
echo "Gogogadgeting files in $EDITDIR"
echo "Adding dtoverlay to $EDITDIR/config.txt"
echo "dtoverlay=dwc2" >>$EDITDIR/config.txt
echo "Inserting module loader into $EDITDIR/cmdline.txt"
sed -i .bak -e "s/rootwait /rootwait modules-load=dwc2,g_ether /" $EDITDIR/cmdline.txt
echo "Touching $EDITDIR/ssh"
touch $EDITDIR/ssh
if [ -e wpa_supplicant.conf ] 
then
    echo "Copying over wpa_supplicant.conf to $EDITDIR"
    cp wpa_supplicant.conf $EDITDIR/wpa_supplicant.conf
fi
echo "Done. Onwards!"
