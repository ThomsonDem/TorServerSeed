#!/bin/sh
echo "________________________________"
echo "TorServerSeed"
echo "________________________________"
echo"install software"
apt-get install tor -y
apt-get install apache2 -y
echo "________________________________"
echo "configure"
echo "________________________________"
echo "HiddenServiceDir /var/lib/tor/hidden_service/http" >> /etc/tor/torrc 
read -p "insert IP : " ip
echo " HiddenServicePort 80 $ip" >> /etc/tor/torrc
echo "________________________________"
echo ""
echo "|see the status on /home/status|"
echo "________________________________"
service apache2 status >> /home/statusapache.txt
service tor status >> /home/statustor.txt
echo "________________________________"
echo "our dark link: " 
echo ".............."
cat /var/lib/tor/hidden_services/hostname
echo ".............."
echo "________________________________"




