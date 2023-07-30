#!/bin/bash
bastionEnv=/home/jaykstah/Bastion
bastionDir=/home/jaykstah/Bastion
backupDir=/media/balaclavabox/backups/bastion

## backup bastion
# remove oldest backuo
rm -r $backupDir/BastionOld
# rename recent backup to old backup
mv $backupDir/Bastion $backupDir/BastionOld
# create new backup
cp -r $bastionDir $backupDir/Bastion

# stop, update, and restart bastion
exec $bastionDir/bastion.sh --stop
exec $bastionDir/bastion.sh --update
exec $bastionDir/bastion.sh --start


