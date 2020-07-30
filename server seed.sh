#!/bin/sh
echo "TorServerSeed"
echo"install software"
apt-get install tor -y
apt-get install apache2 -y

echo "configure"
echo "HiddenServiceDir /var/lib/tor/hidden_service/http" >> /etc/tor/torrc
read -p "insert IP : " ip
echo " HiddenServicePort 80 $ip" >> /etc/tor/torrc

echo "status"
gnome-terminal -e services apache2 status
gnome-terminal -e services tor status

echo "our dark link: " 
echo ".............."
cat /var/lib/tor/hidden_services/hostname
echo ".............."



