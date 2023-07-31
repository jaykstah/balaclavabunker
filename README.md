# balaclavabunker

This repository is a collection of resources I use for services hosted on my homelab. This includes assets for discord bots and scripts I use for maintenance / configuration. 

# BalaclavaBot

This directory pertains to 'BalaclavaBot', the primary discord bot I host. This includes assets for custom commands or misc. configuration. 
BalaclavaBot is a self-hosted instance of the Red discord bot. 

# Server Scripts

This directory includes bash scripts I've written to automate maintenance / configuration tasks such as backing up game servers and running discord bots. 

# Configuration

## Setting directory paths

Edit the file config/path.sh to set relevant paths for each script to use. 
Paths are formatted as a bash variable like the example below:

Variable Name       Path in Quotations (" ")
` gmod_install_dir="/PATH/TO/GMOD/SERVER/" `

Each script which needs a path from this config file should have
`source ../config/path.sh` at the beginning to source these variables. 

# Disclaimer

I, Jaykstah, relinquish all liability for damage, data loss, or inconvenience caused by the usage of these scripts. 
These tools are a work-in-progress and are designed to fulfill my needs for personal projects.

Many of these scripts are written in a way that is specific to my own setup. Using them as-is may cause problems in another system's environment.

These scripts and assets should be used as inspiration and carefully reviewed/modified as needed before use to ensure no damage or misconfiguration to the system occurs. 

If you, the "End User", chooses to download and utilize these scripts, the "End User" assumes all responsibility for damage or data loss that may occur as a result.

Please review these scripts and assets carefully before deploying them on your own system. 

I, Jaykstah, also allow anyone who downloads, uses, or modifies these scripts to freely redistribute them or repurpose them for other uses. 
This colletion of scripts and assets is meant to serve as inspiration for ways to suppliment and automate your own home servers.
