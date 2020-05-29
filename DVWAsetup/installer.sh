#!/bin/bash
clear
echo "[ * ] Checking Internet connection .."
ping -c 2 google.com
if [ $? == 0 ]
then
echo "[ * ]Starting required services ..."
sudo service apache2 start
sudo service mysql start
echo "[ + ] Installing DVWA ...."
wget  https://github.com/ethicalhack3r/DVWA/archive/master.zip
echo "DVWA Downloaded ."
echo "Moving DVWA to localhost file ...."
sleep 3
sudo unzip -d /var/www/html master.zip
rm -rfd master.zip
echo "Downloaded file removed ."
sudo mv /var/www/html/DVWA-master /var/www/html/dvwa
echo "File renamed (DVWA-master) ---> (dvwa)"
sudo rm /var/www/html/dvwa/config/*
sudo cp config/config.inc.php /var/www/html/dvwa/config/
echo "Configuration file Created !"
sudo mysql < config/script.sql
echo "DVWA Successfully installed and Ready to Use ! .."
echo "Firefox will open after 5 sec."
sleep 5
firefox http://127.0.0.1/dvwa
else
echo "[ - ]Check your Internet connection and Try Again :("
fi
