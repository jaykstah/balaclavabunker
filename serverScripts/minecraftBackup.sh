#!/bin/bash
# A very basic Minecraft Server Backup via rsync

# Setting Variables
minecraftOlder=/media/balaclavabox/backups/minecraft/minecraftOlder 
minecraftOld=/media/balaclavabox/backups/minecraft/minecraftOld
minecraftCurrent=/media/balaclavabox/backups/minecraft/minecraftCurrent
minecraftVanilla=/media/balaclavabunker/servers/minecraftVanilla

# Running backup routine
rm -r $minecraftOlder
mv $minecraftOld $minecraftOlder
mv $minecraftCurrent $minecraftOld
mkdir $minecraftCurrent
rsync -av $minecraftVanilla $minecraftCurrent --info=progress2
