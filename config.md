<div align="center">
    <h1>🔨 Configure:</h1>
</div>

# 🗄️ Google Drive Fuse:
TODO

# 🗄️ PlexDrive:
When PlexDrive first runs it will need to be set up to access your Google Drive. To do this you will first need to execute the script provided by the plexdrive image. To do this, run:
```
docker-compose exec plexdrive plexdrive_setup
```
This will run the setup command inside the plexdrive container. It will ask you to enter a client ID and a client secret key, if you already have them generated, paste them in and hit enter. If you don't yet have a client ID or secret key, follow the guide from Cloudbox on how to do it.
Once entered it will prompt you to go to a URL. Simply copy the URL and paste it into your browser. When loaded you will need to sign in to your Google account (If you are using a GSuite account, make sure to log in using that Gsuite account), it will then generate an authentication token. Copy and paste it back into the terminal and hit enter. If the shell stops responding, that's fine, just Ctrl+C to exit out. If you now look inside your config directory you will see a plexdrive directory and inside that should be 2 .json files.

For a more detailed guide, visit: [Cloudbox/Cloudbox/wiki/Install:-Plexdrive](https://github.com/Cloudbox/Cloudbox/wiki/Install:-Plexdrive)

# 📺 Plex:
The last service to configure is Plex. To set up Plex on a remote service, such as a VPS, you will need to SSH tunnel into the service to set up the server and enable remote access. To do this use the command below.

```
ssh username@ip_address -L 8484:localhost:32400
```

When that command has been run, open `localhost:8484/web` in your web browser and you should be able to then set up the server.
Once connected follow through the simple step-by-step guide. When you get to the libraries section, add a `Films` library and set the directory path to `/data/movies` and then add a `TV Shows` library and set the directory path to `/data/tvshows`.
Once all of the setup is done you can exit your SSH tunnel and log in to [app.plex.tv](https://app.plex.tv/desktop) and you should then be able to see your Plex server available.

# 📈 Tautulli:
TODO

# 📋 Ombi:
Almost done. Go to `ombi.ip_address` to access Ombi. Once there, click on `Admin` in the top left. It will ask you to log in, but since this is you first time setting it up, click `Register` instead. Enter your email address and a new password (There is no email server installed with Ombi, it is purely for a username login).

Once the account is created, in the general tab, set the weekly user request limits to 0.

Next up, go to the `Authentication` tab and enable `Enable user permissions` and `Enable user authentication` and then enter your Plex username and password below and click the `Get Token` button to generate a Plex authorization token. This will mean that friends you share your Plex with can log in with their Plex username.

Lastly go to the `Users` tab. Click the `Refresh Friends List` button to fetch your Plex friends list. Here you can set the permissions.

# 🐷 Varken:
TODO

# 🗄 Grafana:
To set up Grafana, our monitoring dashboard, you will need to add InfluxDB as a data source and import the Varken dashboard. Follow the steps below to do this: 

#### Add InfluxDB data source
1) Open `monitoring.ip_address` and login with the username `admin` & password `admin`
2) Set a new admin password
3) Click the green "Add Data Source" button
4) Click the "InfluxDB" button
5) Set "URL" to `http://influxdb:8086`
6) Set "Database" to `jarvis`
7) Click "Save & Test" & check it succeeds saying "Data source is working"

#### Importing the dashboard
1) Click the 2nd item on the left sidebar (The icon that looks like a 2x2 grid)
2) Click the green "New Dashboard" button
3) Click the "New Dashboard" text in the top left
4) Click the "Import Dashboard" button
5) Open [github.com/NuroDev/jarvis/blob/master/dashboard.json](https://github.com/NuroDev/jarvis/blob/master/dashboard.json) and copy the JSON and paste it into the "Or Paste JSON" text field & click the blue "Load"
6) Set `varken` to "InfluxDB" in the dropdown
7) (Optional) Set library names
8) (Optional) Set Ombi URL
9) (Optional) Set Tautulli URL
10) Click the green "Import" button

And you're done. Grafana has all been set up and is now running 👍🏻

# 🏠 Heimdall:
TODO