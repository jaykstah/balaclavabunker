# BalaclavaBunker Server Documentation
___

###Table of Contents

####1. Services
- Automation/Bots
- Games
- Web
- File Sharing / Cloud storage

####2. Update Procedures
- BlaclavaBot
- Minecraft
- NextCloud

___
##Services

###Automation / Bots
---
####BalaclavaBot (Discord bot)

Balaclavabot runs on a self-hosted instance of Bastion. 
It is kept updated to the latest releases of Bastion, with minor changes in configuration.

#####Operation

The bot and its configuration files are stored in `/~Bastion`
`bastion.sh` can be used to run, stop, update, and view the status of the bot.

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
###Games
---
####Minecraft

The main minecraft server is semi-vanilla, running on the [Paper](https://papermc.io/) platform.
It uses minimal plugins for conveninece while preserving an overall Vanilla-esque experience.
<br>
The server can be accessed by connecting to `blbz.xyz:25565` (default port) in-game. 
A live map of the server can be viewed in a browser by going to [blbz.xyz:8123](http://blbz.xyz:8123)
A list of currently installed plugins can be viewed at [https://blbz.xyz/minecraft](https://blbz.xyz/minecraft)
<br>
___
###Web
---
####WordPress
WordPress is used to host the homepage at [https://blbz.xyz](https://blbz.xyz).
WordPress has its own database and user for storing configurations.
Its contents and all site data are located in `/var/www/html`
<br>
For maintenance, an admin can log in at [https://blbz.xyz/wp-admin](https://blbz.xyz/wp-admin) to view the dashboard.

---
#####**Troubleshooting**

#####REST API Error 404

Edit `/etc/apache2/apache2.conf` and change `AllowOverride None` to `AllowOverride All` for `<Directory /var/www/>`
___
###File Sharing / Cloud Storage
---
####NextCloud
Nextcloud is accessible via [https://blbz.xyz/nextcloud](https://blbz.xyz/nextcloud)
New user accounts are given 5GB of personal storage, plus access to certain external storage provided by the server(such as media shares)

NextCloud data is stored externally at `/media/balaclavabunker/ncdata`
This drive must contain the user data, and is separable from the NextCloud install itself which is located at `/var/www/nextcloud`

---
####Local Shares (Samba)
Samba shares are accessible on the local network for all users, in most cases.
A music share can be accessed via `192.168.1.15/musicShare`

___
<br>

##Update Procedures

###BalaclavaBot

___

###Minecraft

####Updating the Game
- Download latest version of paper
- Modify start script to point to correct Paper version

####Updating Plugins
- Grab latest plugin version from respective links at [https://blbz.xyz/minecraft](https://blbz.xyz/minecraft)
- `mv /media/balaclavabunker/server/minecraftVanilla/Plugins /media/balaclavabunker/server/minecraftVanilla/PluginsOld`x

___