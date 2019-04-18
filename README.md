<div align="center">
    <img src="./logo.png" />
</div>

## 📋 Requirements:
These are the required libraries/packages to run this stack:
 - [Docker](https://docker.com)
 - [Docker Compose](https://docs.docker.com/compose/)

## 🔧 Configure:
Sadly there some things that do need to be configured to set up Jarvis. Most of them will be set up automatically via the install script. However there are a few that will require manual creation. All documentation for configuring Jarvis, for both manual and automatic details, can be found in the [config.md](https://github.com/NuroDev/jarvis/blob/master/config.md) file.

## 🚀 Usage:
```shell
curl -L jarvis.nuro.sh | sh
```

## 🔑 Access:
| Container		| Description                | URL                    | Port        |
| ------------- |:--------------------------:|:----------------------:|:-----------:|
| Cadvisor		| Docker Metrics             | `cadvisor.ip_address`  | `8074`      |
| Grafana		| Monitoring Dashboard       | `monitoring.ip_address`| `8075`      |
| Heimdall		| Stack Manager              | `manager.ip_address`   | `8076`      |
| Influx		| Database                   | `db.ip_address`        | `8077`      |
| Ombi			| Content Requesting         | `request.ip_address`   | `8078`      |
| Plex      	| Content Streaming          | `plex.ip_address`      | `32400`     |
| Tautulli      | Plex Metrics               | `tautulli.ip_address`  | `8079`      |
| Traefik       | Reverse Proxy              | `proxy.ip_address`     | `8080`      |

## 📄 License:
MIT © [Ben Dixon](https://github.com/NuroDev/jarvis/blob/master/LICENSE)
