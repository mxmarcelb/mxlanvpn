#!/bin/bash

cd /opt 
sudo mkdir mxlanvpn
cd mxlanvpn
sudo mkdir clients
sudo wget https://pimatico.s3.eu-central-1.amazonaws.com/bindistro/mxlanvpn_v0.1.tar.gz
sudo tar -xvf mxlanvpn_v0.1.tar.gz
sudo rm mxlanvpn_v0.1.tar.gz
sudo chmod +x /opt/mxlanvpn/*.sh

# Konfiguracija OpenVPN-a
sudo apt install ufw -y
sudo ufw allow 22
sudo ufw enable
sudo bash /opt/mxlanvpn/openvpn-install.sh
sudo ufw allow 1194
sudo ufw allow in on tun0 to any port 80
sudo ufw deny 80
#echo "The firewall rules are set"

# Konfiguracija Apache web direktorija za .ovpn konfiguracijske datoteke klijenata
sudo apt install apache2 -y
sudo systemctl disable apache2
sed -i 's/Listen 80$/Listen 8080/' /etc/apache2/ports.conf
# sed -i 's/*:80>/*:8080>/' /etc/apache2/sites-enabled/000-default.conf
sudo cp /opt/mxlanvpn/000-default.conf /etc/apache2/sites-enabled/000-default.conf
sudo chown :www-data -R /opt/mxlanvpn/clients
sudo ufw deny 8080
sudo systemctl disable apache2
sudo systemctl stop apache2

# Linkanje skirpti
sudo rm /usr/bin/mxlanvpn*
sudo ln -s /opt/mxlanvpn/apachetoggle.sh /usr/bin/mxlanvpn-apachetoggle
sudo ln -s /opt/mxlanvpn/bmstoggle.sh /usr/bin/mxlanvpn-bmstoggle
sudo ln -s /opt/mxlanvpn/mxlanvpn.sh /usr/bin/mxlanvpn