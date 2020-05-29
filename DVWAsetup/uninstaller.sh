#!/bin/bash
variable=$(sudo mysql -e "show databases;" | grep dvwa)
if [ "$variable" == "dvwa" ]
then
	sudo mysql -e "drop database dvwa;"
	echo "dvwa database exist and deleted"
else
	echo "dvwa database doesnot exits"
fi
sudo rm -rfd /var/www/html/dvwa
echo ""
echo "[ + ] DVWA uninstallation Success"
