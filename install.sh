#!/bin/bash

set +e

echo "
╔════════════════════════════════════════════════════════╗
║  ╔══════════════════════════════════════════════════╗  ║
║  ║                                                  ║  ║
║  ║        ██╗ █████╗ ██████╗ ██╗   ██╗██╗███████╗   ║  ║
║  ║        ██║██╔══██╗██╔══██╗██║   ██║██║██╔════╝   ║  ║
║  ║        ██║███████║██████╔╝██║   ██║██║███████╗   ║  ║
║  ║   ██   ██║██╔══██║██╔══██╗╚██╗ ██╔╝██║╚════██║   ║  ║
║  ║   ╚█████╔╝██║  ██║██║  ██║ ╚████╔╝ ██║███████║   ║  ║
║  ║   ╚════╝ ╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚══════╝    ║  ║
║  ║                                                  ║  ║
║  ╚══════════════════════════════════════════════════╝  ║
╚════════════════════════════════════════════════════════╝"

echo "
╔═════════════════════════════════════════════════════════════╗
║   Upgrading System ⬆️                                        ║
╚═════════════════════════════════════════════════════════════╝"

# Update/upgrade system
sudo apt-get update -y && sudo apt-get upgrade -y

echo "
╔═════════════════════════════════════════════════════════════╗
║   Installing Docker Compose 🐳                              ║
╚═════════════════════════════════════════════════════════════╝"

# Check if Docker compose is already installed. If so, uninstall it
if test $(which docker-compose); then
    sudo apt-get remove docker-compose
fi

# Install the latest versions of Docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose --version

echo "
╔═════════════════════════════════════════════════════════════╗
║   Downloading ⬇️                                             ║
╚═════════════════════════════════════════════════════════════╝"

# Download and run Jarvis install script from GitHub
curl -L https://raw.githubusercontent.com/NuroDev/jarvis/master/docker-compose.yml -o ./docker-compose.yml

echo "
╔═════════════════════════════════════════════════════════════╗
║   Configuring .env 🤫                                       ║
╚═════════════════════════════════════════════════════════════╝"

# Create empty `.env` file and get user input for config environment vars
touch .env
echo "
# User Info
USER_UID=$(id -u)
USER_GID=$(id -g)
" >> .env
read -p "Email Address:" email_address
if test -z "$email_address"; then
    domain_name="name@email.com"
fi
echo "
EMAIL=${email_address}

" >> .env

echo "
# Networking
IP=$(hostname -I)
" >> .env
read -p "Domain Name (Default: 'localhost'):" domain_name
if test -z "$domain_name"; then
    domain_name="localhost"
fi

read -p "Config Directory (Default: './config'):" config_dir
if test -z "$config_dir"; then
    config_dir="./config"
fi

read -p "Media Write Directory (Default: './media_write'):" media_write
if test -z "$media_write"; then
    media_write="./media_write"
fi

read -p "Media Read Directory (Default: './media_read'):" media_read
if test -z "$media_read"; then
    media_read="./media_read"
fi

read -p "Transcode Directory (Default: './transcode'):" transcode_dir
if test -z "$transcode_dir"; then
    transcode_dir="./transcode"
fi

echo "
DOMAIN=${domain_name}

# Directories
CONFIG_DIR=${config_dir}
MEDIA_WRITE_DIR=${media_write}
MEDIA_READ_DIR=${media_read}
TRANSCODE_DIR=${transcode_dir}
" >> .env

echo "
╔═════════════════════════════════════════════════════════════╗
║   Configuring Traefik 🚦                                    ║
╚═════════════════════════════════════════════════════════════╝"

# Download Traefik config files from GitHub and move it to config directory
curl -L https://raw.githubusercontent.com/NuroDev/jarvis/master/templates/traefik.toml -o ./${config_dir}/traefik.toml
curl -L https://raw.githubusercontent.com/NuroDev/jarvis/master/templates/acme.json -o ./${config_dir}/acme.json
chmod 600 ./${config_dir}/acme.json

echo "
╔═════════════════════════════════════════════════════════════╗
║   Starting 🚀                                               ║
╚═════════════════════════════════════════════════════════════╝"

# Build and starts all containers in the stack
docker-compose up -d

echo "
╔═════════════════════════════════════════════════════════════╗
║   Configuring PlexDrive 🗄                                  ║
╚═════════════════════════════════════════════════════════════╝"

docker exec -it plexdrive plexdrive_setup

echo "
╔═════════════════════════════════════════════════════════════╗
║   Configuring Varken 🐷                                     ║
╚═════════════════════════════════════════════════════════════╝"

# Download Varken config from GitHub and move it to config directory
curl -L https://raw.githubusercontent.com/NuroDev/jarvis/master/templates/varken.ini -o ./${config_dir}/varken/varken.ini

echo "
╔═════════════════════════════════════════════════════════════╗
║   Done! 🎉                                                  ║
╚═════════════════════════════════════════════════════════════╝"
