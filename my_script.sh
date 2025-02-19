#!bin/bash

#OS detection
 cat /etc/os-release
 if [ "$OSTYPE" == "UBUNTU" ]; then
    #upgrade system
    sudo apt update && sudo apt upgrade -y
    #nginx check and install if not present
    else
        continue
   #upgrade system
if nginx -v; then
     echo "Nginx is already installed"
   else
     sudo apt install nginx -y
     sudo systemctl start nginx
     sudo systemctl enable nginx
   fi
   #mongodb  check and install if not present
   if mongo --version; then
     echo "MongoDB is already installed"
   else
     sudo apt-get install gnupg curl
     curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-8.0.gpg \
   --dearmor
   echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/8.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list
   sudo apt-get update
     sudo apt install mongodb-org -y
     sudo systemctl start mongodb
     sudo systemctl enable mongodb
   fi
 fi


