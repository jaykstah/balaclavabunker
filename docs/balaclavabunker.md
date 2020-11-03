# BalaclavaBunker Server Documentation
___

###Table of Contents

####[1. Services](#services)
- [Automation/Bots](#automation)
- [Games](#games)
- [Web](#web)
- [File Sharing / Cloud storage](#files)

####2. Update Procedures
- BlaclavaBot
- Minecraft
- NextCloud

___
<a id="services"></a>
##Services
<a id="automation"></a>
###Automation / Bots
---
<a id="balaclavabot"></a>
####BalaclavaBot (Discord bot)

Balaclavabot runs on a self-hosted instance of Bastion. 
It is kept updated to the latest releases of Bastion, with minor changes in configuration.

#####Operation

The bot and its configuration files are stored in `~/Bastion`
From there, `bastion.sh` can be used to run, stop, update, and view the status of the bot.

Available options:

`--start` will run the bot. It will create a screen called `BastionBot` that can be connected to, in order to view the bot's console output. 
`--stop` will stop the bot and destroy the screen it was using
`--status` will show a simple status output that indicates whether the bot is running or has been stopped unexpectedly
`--update` will run an update for Bastion. This includes the bot itself, the dependencies contained within its folder, and node modules that the bot uses.

#####Configuration

The bot can be configured via `yaml` files located in `~/Bastion/settings`

`configurations.yaml` contains basic bot configuration, such as its prefix and commands to be automatically run at set intervals.

`credentials.yaml` is used to set who the bot's owner is (via their Discord Client ID) as well as API keys that the bot may use for certain command functions.

#####Commands

All commands for the bot can be found at [https://bastion.traction.one/commands](https://bastion.traction.one/commands)
___
<a id="games"></a>
###Games
---
####Minecraft

The main minecraft server is semi-vanilla, running on the [Paper](https://papermc.io/) platform.
It uses minimal plugins for conveninece while preserving an overall Vanilla-esque experience.
<br>
The server can be accessed by connecting to `blbz.xyz:25565` (default port) in-game. 
A live map of the server, powered by the Dynmap plugin, can be viewed in a browser by going to [blbz.xyz:8123](http://blbz.xyz:8123)
A list of currently installed plugins can be viewed at [https://blbz.xyz/minecraft](https://blbz.xyz/minecraft) with links to their development pages
An alternate list of currently used plugins is available in the vanilla server plugins folder as `README.md`
<br>
___
<a id="web"></a>
###Web
---
####WordPress
WordPress is used to host the homepage at [https://blbz.xyz](https://blbz.xyz).
WordPress has its own database and user for storing configurations.
Its contents and all site data are located in `/var/www/html` with moth of its directory names beginning in `wp-`
<br>
For maintenance, an admin can log in at [https://blbz.xyz/wp-admin](https://blbz.xyz/wp-admin) to view the dashboard.

---
#####**Troubleshooting**

#####REST API Error 404

Edit `/etc/apache2/apache2.conf` and change `AllowOverride None` to `AllowOverride All` for `<Directory /var/www/>`
___
<a id="files"></a>
###File Sharing / Cloud Storage
---
####Nextcloud
Nextcloud is accessible via [https://blbz.xyz/nextcloud](https://blbz.xyz/nextcloud)
New user accounts are given 5GB of personal storage, plus access to certain external storage provided by the server (such as media shares)

Nextcloud itself is installed at `/var/www/nextcloud`
Nextcloud data is stored externally at `/media/balaclavabunker/ncdata`
The data directory contains user data and some configurations. It is on a separate physical disk from the install so that user data can be stored en masse without filling the root partition. 

---
####Local Shares (Samba)
Samba shares are accessible on the local network for all users, in most cases.
A music share can be accessed via `192.168.1.15/musicShare`

___
<br>

##Update Procedures

###BalaclavaBot
- Check BastionHQ announcements for any relevant informationk
- Shutdown the bot with `./bastion.sh --stop`
- Run an update from Bastion's directory with `./bastion.sh --update`
- On completion of the update, start the bot with `./bastion.sh --start`
- Connect to Bastion's screen with `screen -r BastionBot` and watch for new errors that may have been caused by the update.
- Send an announcement in Discord `#announcements` if there is any important information regarding the new bot version.
___

###Minecraft

####Updating the Game
- Download latest version of paper
- Send newest paper version to `/media/balaclavabunker/servers/minecraftVanilla/paperBuilds`
- Remove currently used paper jarfile from vanilla server directory
- Copy newest build from `paperBuilds` and place it in the main server directory as `paper.jar` so the server will use it

####Updating Plugins
- Grab latest plugin versions from respective links at [https://blbz.xyz/minecraft](https://blbz.xyz/minecraft)
- Move new plugins to `/media/balaclavabunker/servers/minecraftVanilla/pluginsStaging`
- Once all current versions of plugins are placed in staging, run `minecraftPluginUpdate.sh` to commit staged plugins and backup previous plugin jarfiles.

####Post Update
- List relevant changes in a formatted announcement on Discord in `#bot-commands-admin`
- Specify in the announcement if the client must use a newer version of Minecraft to connect, or if the server is held back to a previous version
- Review for errors and submit via Bastion's reaction pinning function
- Edit version number on [blbz minecraft homepage](https://blbz.xyz/minecraft) if game version is updated

___