#!/bin/bash
# A very basic Minecraft Server Backup via rsync

# Setting Variables
## Directories
minecraftOlder=/media/balaclavabox/backups/minecraft/minecraftOlder 
minecraftOld=/media/balaclavabox/backups/minecraft/minecraftOld
minecraftCurrent=/media/balaclavabox/backups/minecraft/minecraftCurrent
minecraftVanilla=/media/balaclavabunker/servers/minecraftVanilla
## Archives
minecraftOlderTar=/media/balaclavabox/backups/minecraft/minecraftOlder.tar
minecraftOldTar=/media/balaclavabox/backups/minecraft/minecraftOld.tar
minecraftCurrentTar=/media/balaclavabox/backups/minecraft/minecraftCurrent.tar

backupLog=/media/balaclavabox/backups/minecraft/log.txt
currentDate='date'

# Creating directories for backup routine
# mkdir $minecraftOld
# mkdir $minecraftOlder

# Running backup routine
rm $minecraftOlderTar
mv $minecraftOldTar $minecraftOlderTar
mv $minecraftCurrentTar $minecraftOldTar
mkdir $minecraftCurrent
rsync -av --exclude 'plugins/dynmap/' $minecraftVanilla $minecraftCurrent --info=progress2
echo $currentDate > $backupLog

# Compressing archives and removing original files to save space
tar -cf $minecraftCurrentTar $minecraftCurrent
rm -r $minecraftCurrent
