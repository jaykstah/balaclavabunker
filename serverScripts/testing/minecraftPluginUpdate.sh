#!/bin/bash
currentPlugins="/media/balaclavabunker/servers/minecraftVanilla/plugins"
archivedPlugins="/media/balaclavabunker/servers/minecraftVanilla/pluginsArchive"
ancientPlugins="/media/balaclavabunker/servers/minecraftVanilla/pluginsArchive/old"

main() {

mv $archivedPlugins/*.jar $ancientPlugins/
mv $currentPlugins/*.jar $archivedPlugins

}
