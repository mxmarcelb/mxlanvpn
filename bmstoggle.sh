#!/bin/bash

bmsDBfile=/home/pimatico/database/alternativeLocalhostFrontendMode

if [ -f "$bmsDBfile" ]; then
    #exist
    sudo rm $bmsDBfile
    sudo systemctl stop openvpn-server@server.service
    sudo systemctl disable openvpn-server@server.service
    sudo systemctl restart pimaticoSlave.service
else 
    # dont exist
    sudo touch $bmsDBfile
    sudo systemctl start openvpn-server@server.service
    sudo systemctl enable openvpn-server@server.service
    sudo systemctl restart pimaticoSlave.service
fi