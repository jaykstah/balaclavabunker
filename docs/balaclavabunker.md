# BalaclavaBunker Server Documentation
___

###Table of Contents

####[1. Services](#services)
- [Automation/Bots](#automation)
- [Games](#games)
- [Web](#web)
- [File Sharing / Cloud storage](#files)

####[2. Update Procedures](#updates)
- [BlaclavaBot](#botUpdate)
- [Minecraft](#minecraftUpdate)
- [NextCloud](#nextcloudUpdate)

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

#####Responsibilities
The main BalaclavaBot is currently used for a few specific responsibilities as follows:
- Automatically assign users a role as they join the server
- Usage of a level-up system for users in chat
- Automatic responses triggered by certain phrases
- Sending messages to the announcement channel

It should be noted that other capabilities are currently disabled, such as music, as these will be handled by 'BalaclavaBeta', which runs on the Red bot. 

#####Operation

The bot and its configuration files are stored in `~/Bastion`
From there, `bastion.sh` can be used to run, stop, update, and view the status of the bot.

Available options:

`--start` will run the bot. It will create a screen called `BastionBot` that can be connected to, in order to view the bot's console output. 
`--stop` will stop the bot and destroy the screen it was using
`--status` will show a simple status output that indicates whether the bot is running or has been stopped unexpectedly
`--update` will run an update for Bastion. This includes the bot itself, the dependencies contained within its folder, and node modules that the bot uses.

#####Configuration
Currently the bot is configured to use `.` as a prefix for commands.

The bot can be configured via `yaml` files located in `~/Bastion/settings`

`configurations.yaml` contains basic bot configuration, such as its prefix and commands to be automatically run at set intervals.

`credentials.yaml` is used to set who the bot's owner is (via their Discord Client ID) as well as API keys that the bot may use for certain command functions.

#####Commands

All commands for the bot can be found at [https://bastion.traction.one/commands](https://bastion.traction.one/commands)
___

####BalaclavaBeta (Discord Bot)
BalaclavaBeta runs on the Red discord bot (https://discord.red) and serves currently to fill the gaps in functionality that BalaclavaBot (running on Bastion) has.

##### Responsibilities
Primary use of this bot consist of:
- Music

##### Operation
From a starting point, an admin must first execute `source ~/redenv/bin/activate` to make use of Red commands. This may require switching to bash first if there is a different shell in use by default.

Once running in the Red environment, the bot can be started. The main installation of Red is denoted as BalaclavaRed.

<a id="games"></a>
###Games
---
####Minecraft

The main minecraft server is semi-vanilla, running on the [Paper](https://papermc.io/) platform.
It uses minimal plugins for conveninece while preserving an overall Vanilla-esque experience.
<br>
To start the server: 
- start a new terminal screen and move to `/media/balaclavabunker/servers/minecraftVanilla/`
- press `CTL+A` then `CTL+:` and enter `sessionname minecraft`
- execute `./start.sh` to startup the server. Watch the startup procedure for errors.
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
Its contents and all site data are located in `/var/www/html` with most of its directory names beginning in `wp-`
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

Some other media accessible from Nextcloud is stored in `/media/balaclavabox/` such as music, shows, and archives/backups.

---
####Local Shares (Samba)
Samba shares are accessible on the local network for all users, in most cases.
A music share can be accessed via `192.168.1.15/musicShare`

___
<br>
<a id="updates"></a>
##Update Procedures

<a id="botUpdate"></a>
###BalaclavaBot
- Check BastionHQ announcements for any relevant information
- Shutdown the bot with `./bastion.sh --stop`
- Run an update from Bastion's directory with `./bastion.sh --update`
- On completion of the update, start the bot with `./bastion.sh --start`
- Connect to Bastion's screen with `screen -r BastionBot` and watch for new errors that may have been caused by the update.
- Send an announcement in Discord `#announcements` if there is any important information regarding the new bot version.
___

<a id="minecraftUpdate"></a>
###Minecraft
For the sake of brevity, `$minecraftVanilla` will be used to refer to the main server directory, which has a full path of `/media/balaclavabunker/servers/minecraftVanilla`

####Updating the Game
- Download latest version of Paper
- Move the currently used `paper.jar` to `$minecraftVanilla/paperBuilds`
- Send newest Paper version to `$minecraftVanilla/` and rename the jarfile to `paper.jar`

####Updating Plugins
- Grab latest plugin versions from respective links at [https://blbz.xyz/minecraft](https://blbz.xyz/minecraft)
- Clean up by moving all jarfiles in `$minecraftVanilla/pluginsArchive` into `$minecraftVanilla/pluginsArchive/old`
- Move currently installed plugins to `$minecraftVanilla/pluginsArchive` (`cd` into `minecraftVanilla/plugins` and make use of `mv *.jar ../pluginsArchive`)
- Send newly downloaded plugins to `$minecraftVanilla/plugins` and restart server.

####Post Update
- List relevant changes in a formatted announcement on Discord in `#bot-commands-admin`
- Specify in the announcement if the client must use a newer version of Minecraft to connect, or if the server is held back to a previous version
- Review for errors and submit via BalaclavaBot's announcement pinning function
- Edit version number on [blbz minecraft homepage](https://blbz.xyz/minecraft) if game version is updated

<a id="nextcloudUpdate"></a>
###Nextcloud
Most of the time Nextcloud can be updated via the web-based settings page. 
If not, an update may need to be executed via `ocs` commands. Until this page is written further, it will be necessary to refer to Nextcloud documentation or instructions on the web-based settings page as to performing updates from the command line.
