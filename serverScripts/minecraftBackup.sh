#!/bin/bash
# A very basic Minecraft Server Backup via rsync

# Setting Variables

####### Directories Old
# minecraftOlder=/media/balaclavabox/backups/minecraft/minecraftOlder 
# minecraftOld=/media/balaclavabox/backups/minecraft/minecraftOld
# minecraftCurrent=/media/balaclavabox/backups/minecraft/minecraftCurrent
######

minecraftVanilla=/media/balaclavabunker/servers/minecraftVanilla

## Archives
minecraftOlderTar=/media/balaclavabox/backups/minecraft/minecraftOlder.tar.gz
minecraftOldTar=/media/balaclavabox/backups/minecraft/minecraftOld.tar.gz
minecraftCurrentTar=/media/balaclavabox/backups/minecraft/minecraftCurrent.tar.gz

backupLog=/media/balaclavabox/backups/minecraft/log.txt
currentDate='date'

# Running backup routine
rm $minecraftOlderTar
mv $minecraftOldTar $minecraftOlderTar
mv $minecraftCurrentTar $minecraftOldTar

### DEPRECATED ###
# mkdir $minecraftCurrent
# rsync -av --exclude 'plugins/dynmap/' $minecraftVanilla $minecraftCurrent --info=progress2
###

# Compress minecraft into backup archive, excluding dynmap to save space
#tar -czvf $minecraftCurrentTar --exclude=$minecraftVanilla/plugins/dynmap $minecraftVanilla

# Compress minecraft into backup archive, including all subdirectories
tar -czvf $minecraftCurrentTar $minecraftVanilla

# Timestamp saved after backup routine
date > /media/balaclavabox/backups/minecraft/recentBackup.txt
