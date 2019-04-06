<div align="center">
    <h1>🔨 Configure:</h1>
</div>

# 🔀 Traefik - Reverse Proxy:
TODO

# 🗄 Influx - Database:
TODO

# 📈 Chronograf - Influx Visualization:
TODO

# 🐳 Cadvisor - Docker Resource Monitoring:
TODO

# 🐷 Varken - Plex Data Aggregator:
TODO

# 🗄 Grafana - Monitoring Dashboard:
TODO

# 🗄️ Google Drive Fuse - Google Drive Virtual Mount:
TODO

# 🗄️ PlexDrive - Read-only Streaming optimised Google Drive Virtual Mount:
When PlexDrive first runs it will need to be set up to access your Google Drive. To do this you will first need to execute the script provided by the plexdrive image. To do this, run:
```
docker-compose exec plexdrive plexdrive_setup
```
This will run the setup command inside the plexdrive container. It will ask you to enter a client ID and a client secret key, if you already have them generated, paste them in and hit enter. If you don't yet have a client ID or secret key, follow the guide from Cloudbox on how to do it.
Once entered it will prompt you to go to a URL. Simply copy the URL and paste it into your browser. When loaded you will need to sign in to your Google account (If you are using a GSuite account, make sure to log in using that Gsuite account), it will then generate an authentication token. Copy and paste it back into the terminal and hit enter. If the shell stops responding, that's fine, just Ctrl+C to exit out. If you now look inside your config directory you will see a plexdrive directory and inside that should be 2 .json files.

For a more detailed guide, visit: [Cloudbox/Cloudbox/wiki/Install:-Plexdrive](https://github.com/Cloudbox/Cloudbox/wiki/Install:-Plexdrive)

# 📋 Ombi - Content Requesting:
Almost done. Go to `ombi.ip_address` to access Ombi. Once there, click on `Admin` in the top left. It will ask you to log in, but since this is you first time setting it up, click `Register` instead. Enter your email address and a new password (There is no email server installed with Ombi, it is purely for a username login).

Once the account is created, in the general tab, set the weekly user request limits to 0.

Next up, go to the `Authentication` tab and enable `Enable user permissions` and `Enable user authentication` and then enter your Plex username and password below and click the `Get Token` button to generate a Plex authorization token. This will mean that friends you share your Plex with can log in with their Plex username.

Lastly go to the `Users` tab. Click the `Refresh Friends List` button to fetch your Plex friends list. Here you can set the permissions.
