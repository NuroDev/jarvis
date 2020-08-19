#!/bin/bash

set +e

echo "
╔═══════════════════════════════════════════════════════════════════════╗
║  ╔═════════════════════════════════════════════════════════════════╗  ║
║  ║                                                                 ║  ║
║  ║               ██╗ █████╗ ██████╗ ██╗   ██╗██╗███████╗           ║  ║
║  ║               ██║██╔══██╗██╔══██╗██║   ██║██║██╔════╝           ║  ║
║  ║               ██║███████║██████╔╝██║   ██║██║███████╗           ║  ║
║  ║          ██   ██║██╔══██║██╔══██╗╚██╗ ██╔╝██║╚════██║           ║  ║
║  ║          ╚█████╔╝██║  ██║██║  ██║ ╚████╔╝ ██║███████║           ║  ║
║  ║          ╚════╝ ╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚══════╝            ║  ║
║  ║                                                                 ║  ║
║  ╚═════════════════════════════════════════════════════════════════╝  ║
╚═══════════════════════════════════════════════════════════════════════╝"

echo "
╔═════════════════════════════════════════════════════════════╗
║   Installing Docker Compose 🐳                              ║
╚═════════════════════════════════════════════════════════════╝"
if test $(which docker-compose); then
    sudo apt-get remove docker-compose
fi

sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

echo "
╔═════════════════════════════════════════════════════════════╗
║   Downloading ⬇️                                             ║
╚═════════════════════════════════════════════════════════════╝"
git clone https://github.com/nurodev/jarvis.git
cd ./jarvis/

echo "
╔═════════════════════════════════════════════════════════════╗
║   Configuring .env 🤫                                       ║
╚═════════════════════════════════════════════════════════════╝"
cp ./example.env .env

echo "
╔═════════════════════════════════════════════════════════════╗
║   Starting 🚀                                               ║
╚═════════════════════════════════════════════════════════════╝"
docker-compose up -d

echo "
╔═════════════════════════════════════════════════════════════╗
║   Done! 🎉                                                  ║
╚═════════════════════════════════════════════════════════════╝"
