<div align="center">
    <img src="./.github/assets/logo.png" />

  [![License](https://img.shields.io/badge/-mit-blue.svg?longCache=true&style=for-the-badge)](https://github.com/nurodev/jarvis/blob/master/LICENSE)
  [![Build](https://img.shields.io/github/workflow/status/nurodev/jarvis/%F0%9F%9A%80%20Deploy?label=%20&logo=github&logoColor=white&style=for-the-badge)](https://github.com/NuroDev/jarvis/actions?query=workflow%3A%22%F0%9F%9A%80+Deploy%22) 
  [![Gitmoji](https://img.shields.io/badge/-%20%F0%9F%98%9C-FFDD67.svg?longCache=true&style=for-the-badge)](https://gitmoji.carloscuesta.me/) 
</div>

Jarvis is a simple and easy to setup media stack that can be deployed on any unix based system that has Docker installed within a few minutes and offer a near feature complete self-hosted media system:

- [Cadvisor](https://github.com/google/cadvisor) - Docker metrics
- [Grafana](https://grafana.com/) - Monitoring Dashboard
- [Homer](https://github.com/bastienwirtz/homer) - Home dashboard
- [Node Exporter](https://github.com/prometheus/node_exporter) - System metrics
- [Ombi](https://ombi.io/) - Content requesting
- [Plex](https://www.plex.tv/) - Content streaming
- [Prometheus](https://prometheus.io/) - Metrics Database
- [Tautulli](https://tautulli.com/) - Plex Metrics

## 📋 Requirements
These are the required libraries/packages to run this stack:
 - [Docker](https://docker.com)
 - [Docker Compose](https://docs.docker.com/compose/)

## 🚀 Usage
```shell
curl -sSL https://jarvis.nuro.dev | sh
```

## 🔧 Configure
For the most part, once the stack has been setup and deployed there are 2 key configuration steps that needs to be done.


<details>
  <summary>🏡 Homer</summary>
  
  The first step is to modify the Homer config file. This can be found under `config/homer/config.yml`.

  In here you can modify your home dashboard with whatever links or customization you like. A number of service links have already been provided, however there is one key configration requirement and that is to modify the URL's set for each service to be the domain of your choice.

</details>

<details>
  <summary>📫 Email (Optional)</summary>
  
  To generate a certificate from Let's Encrypt, an email address is required. As such in the `Caddyfile` a placeholder `email` global variable has been provided but commented out. Uncomment the variable by removing the `#` and entering your email address.

  You can also optionally modify the `acme_ca` URL, which specifies the URL to the ACME CA's directory. However it is recommended to leave this to the default Let's Encrypt production endpoint unless you require the use of the Let's Encrypt [staging or development endpoints](https://letsencrypt.org/docs/staging-environment/).

</details>

## 🔑 Access
| Container	        | Description                | URL                              |
| ------------------|:--------------------------:|:--------------------------------:|
| Cadvisor	        | Docker Metrics             | `cadvisor.ip_address`            |
| Grafana	          | Monitoring Dashboard       | `monitoring.ip_address`          |
| Homer 	          | Home Dashboard             | `ip_address`                     |
| Node Exporter     | System Metrics             | `node_exporter.ip_address`       |
| Ombi		          | Content Requesting         | `request.ip_address`             |
| Plex              | Content Streaming          | `watch.ip_address`               |
| Prometheus        | Metrics Database           | `prometheus.ip_address`          |
| Tautulli          | Plex Metrics               | `tautulli.ip_address`            |

## ✅ Optional

There are some work-in-progress optional branches that trade some services for alternatives.

The most recent of such branches has been the [`jellyfin`](https://github.com/NuroDev/jarvis/tree/jellyfin) branch which replaces the `plex` and `tautulli` services with [Jellyfin](https://jellyfin.org/) which is a completely self-hosted media server, compared to Plex which still requires on services hosted by Plex themselves.

To get started using the [`jellyfin`](https://github.com/NuroDev/jarvis/tree/jellyfin) branch, use the following command in place of the one above:
```shell
curl -sSL https://jarvis.nuro.dev/jellyfin | sh
```
Or check the [`jellyfin`](https://github.com/NuroDev/jarvis/tree/jellyfin) branch for more details.

## 📋 TODO

- [x] Add GitHub Actions CI for testing.
- [ ] Fix Homer service URL's so they're based on the `DOMAIN` environment vairable.
- [ ] Add `basicauth` to some metric endpoints via the [Caddy Module](https://caddyserver.com/docs/caddyfile/directives/basicauth).
- [ ] Add Caddy prometheus metrics using [Caddy module](https://github.com/hairyhenderson/caddyprom) (Requires custom Caddy image build).
- [ ] Provide custom pre-made Grafana dashboard.
- [ ] Add [Varken](https://github.com/Boerderij/Varken) data aggregator container.
