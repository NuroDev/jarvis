<div align="center">
    <img src="https://i.imgur.com/EdSHQCW.png" />
    <h1>Jarvis</h1>
    <p>Quick & easy to set up automated cloud media system</p>
</div>

## 📋 Requirements:
These are the required libraries/packages to run this stack:
 - [Docker](https://docker.com)
 - [Docker Compose](https://docs.docker.com/compose/)

## ⬇️ Installation:
```shell
git clone https://github.com/NuroDev/jarvis.git
```
```shell
cd jarvis/
```

## 🏗 Setup:
Before you can get started, you will need to create the required `.env` file. The best way to do this is to copy the example `.env` file's provided. Run the following commend for both the frontend and the backend:
```
cp example.env .env
```
Once the `.env` file has been copied, open the file in your chosen editor, EG: Vim, Emacs, Nano, etc. When in there, change the required directories to point to your desired locations.
You will also need to enter your domain name and login details for the Transmission VPN in the backend env file.

## 🔧 Configure:
Sadly there are some containers that do require some extra setup to get up and running. Others will require some configuring once the application is setup and running to get working correctly.
You can find all documentation for all container configuration in the [config.md file](https://github.com/NuroDev/jarvis/blob/master/config.md)

## 🚀 Usage:
```
docker-compose up -d
```

## 🔑 Access:
| Container		| URL                    |
| ------------- |:----------------------:|
| Traefik       | `proxy.ip_address`     |
| Heimdall		| `manager.ip_address`   |
| InfluxDB		| `database.ip_address`  |
| Cadvisor		| `cadvisor.ip_address`  |
| Grafana		| `monitoring.ip_address`|
| Plex      	| `plex.ip_address/web`  |
| Ombi			| `request.ip_address`	 |

## 📄 License:
MIT © [Ben Dixon](https://github.com/NuroDev/jarvis/blob/master/LICENSE)
