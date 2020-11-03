#!/bin/bash

### Setting variables

pluginsStaging=/media/balaclavabunker/servers/minecraftVanilla/pluginsStaging
plugins=/media/balaclavabunker/servers/minecraftVanilla/plugins
pluginsOld=/media/balclavabunker/servers/minecraftVanilla/pluginsOld
pluginsOlder=/media/balaclavabunker/servers/minecraftVanilla/.pluginsOlder

### Moving previous pluginsOld for safekeeping

# cleaning previous attempt
rm -r $pluginsOlder

# moving plugins
mv $pluginsOld $pluginsOlder

#creating new plugin archive
mkdir $pluginsOld

### Moving current plugin jarfiles to pluginsOld
mv $plugins/*.jar $pluginsOld

### Commit staged plugins to plugin folder
cp $pluginStaging/*.jar $plugins/


