#!/bin/bash

apacheState=$(sudo systemctl status apache2 | grep inactive)

if [ -z "$apacheState" ] 
then
    # pokrenut je ugasi ga
    sudo systemctl stop apache2
    sudo ufw deny 8080
    echo "Apache is stoped"
else
    # nije pokrenut upali ga
    sudo systemctl start apache2
    sudo ufw allow 8080
    echo "Apache is started"
fi