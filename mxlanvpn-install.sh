#!/bin/bash

cd /opt 
#sudo wget kasnije dodaj path
#tar -xvf kasnije dodaj naziv

# Konfiguracija OpenVPN-a
sudo bash /opt/mxlanvpn/openvpn-install.sh
sudo ufw allow 1194
sudo ufw allow in on tun0 to any port 8008
#echo "The firewall rules are set"

# Konfiguracija Apache web direktorija za .ovpn konfiguracijske datoteke klijenata
sudo apt install apache2
sudo systemctl disable apache2
sed -i 's/Listen 80$/Listen 8080/' /etc/apache2/ports.conf
# sed -i 's/*:80>/*:8080>/' /etc/apache2/sites-enabled/000-default.conf
sudo cp /opt/mxlanvpn/000-default.conf /etc/apache2/sites-enabled/000-default.conf
sudo chown :www-data -R /opt/mxlanvpn/clients
sudo ufw allow 8080
sudo systemctl disable apache2
sudo systemctl restart apache2

# Linkanje skirpti
sudo ln -s /opt/mxlanvpn/apachetoggle.sh /usr/bin/mxlanvpn-apachetoggle
sudo ln -s /opt/mxlanvpn/bmstoggle.sh /usr/bin/mxlanvpn-bmstoggle