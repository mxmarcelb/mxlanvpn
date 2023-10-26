#!/bin/bash

bmsDBfile=/home/pimatico/database/alternativeLocalhostFrontendMode

if [ -f "$bmsDBfile" ]; then
    #exist - to classic frontend
    sudo rm $bmsDBfile
    sudo systemctl stop openvpn-server@server.service
    sudo systemctl disable openvpn-server@server.service
    sudo systemctl restart pimaticoSlave.service
    sudo ufw allow 80
else 
    # dont exist - to modern frontend
    sudo touch $bmsDBfile
    sudo systemctl start openvpn-server@server.service
    sudo systemctl enable openvpn-server@server.service
    sudo ufw deny 80
    sudo systemctl restart pimaticoSlave.service
fi