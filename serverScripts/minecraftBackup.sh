#!/bin/bash
# A very basic Minecraft Server Backup via rsync
rm -r /media/balaclavabox/backups/minecraft/minecraftOlder
mv /media/balaclavabox/backups/minecraft/minecraftOld /media/balaclavabox/backups/minecraft/minecraftOlder
mv /media/balaclavabox/backups/minecraft/minecraftCurrent /media/balaclavabox/backups/minecraft/minecraftOld
mkdir /media/balaclavabox/backups/minecraft/minecraftCurrent
rsync -av /media/balaclavabunker/servers/minecraftVanilla /media/balaclavabox/backups/minecraft/minecraftCurrent --info=progress2
