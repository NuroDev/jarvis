<div align="center">
    <img src="./.github/assets/logo.png" />

  [![License](https://img.shields.io/badge/-mit-blue.svg?longCache=true&style=for-the-badge)](https://github.com/nurodev/jarvis/blob/master/LICENSE)
  [![Build](https://img.shields.io/github/workflow/status/nurodev/jarvis/%F0%9F%9A%80%20Deploy?label=%20&logo=github&logoColor=white&style=for-the-badge)](https://github.com/NuroDev/jarvis/actions?query=workflow%3A%22%F0%9F%9A%80+Deploy%22) 
  [![Gitmoji](https://img.shields.io/badge/-%20%F0%9F%98%9C-FFDD67.svg?longCache=true&style=for-the-badge)](https://gitmoji.carloscuesta.me/) 

</div>


## 📋 Requirements
These are the required libraries/packages to run this stack:
 - [Docker](https://docker.com)
 - [Docker Compose](https://docs.docker.com/compose/)

## 🚀 Usage
```shell
curl -L jarvis.nuro.dev | sh
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

## ⚠️ Disclaimer
This stack is designed for self-hosted use and not for any sort of enterprise environment.

However, if you do wish to modify your own installation to make it usable in such an environment then feel free to do so.
The largest of such changes that are recommended are to remove or add [basicauth](https://caddyserver.com/docs/caddyfile/directives/basicauth) to some containers, such as the metrics database, Prometheus.

A helpful guide on how to do this can be found here: [DoTheEvo/selfhosted-apps-docker](https://github.com/DoTheEvo/selfhosted-apps-docker/tree/master/caddy_v2#basic-authentication)

## 📋 TODO

- [ ] Add GitHub Actions CI for testing.
- [ ] Fix Homer service URL's so they're based on the `DOMAIN` environment vairable.
- [ ] Add `basicauth` to some metric endpoints via the [Caddy Module](https://caddyserver.com/docs/caddyfile/directives/basicauth).
- [ ] Add Caddy prometheus metrics using [Caddy module](https://github.com/hairyhenderson/caddyprom) (Requires custom Caddy image build).
- [ ] Provide custom pre-made Grafana dashboard.
- [ ] Add [Varken](https://github.com/Boerderij/Varken) data aggregator container.

## 📄 License
MIT © [Ben Dixon](https://github.com/nurodev/jarvis/blob/master/LICENSE)
