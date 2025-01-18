apa#!/bin/sh
echo "________________________________"
echo "TorServerSeed"
echo "________________________________"
echo"install software"
//settaggio per installare tor
echo "preconfiguration" //test
apt update
apt install apt-transport-https
add-apt-repository universe
wget -q -O - https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | sudo apt-key add -
echo "deb https://deb.torproject.org/torproject.org $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list
apt udpdate
//fine settaggio
apt-get install tor -y
apt-get install apache2 -y
echo "________________________________"
echo "configure"
echo "________________________________"
echo "HiddenServiceDir /var/lib/tor/hidden_service/http" >> /etc/tor/torrc 
read -p "insert IP : " ip
echo " HiddenServicePort 80 $ip" >> /etc/tor/torrc
sudo systemctl restart tor
sudo service tor start
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




