#! /usr/bin/env bash
# hello-world/uninstall-extras.sh
# remove the config file and locales  directory if present
echo "Running uninstall-extras.sh"
HELLO_WORLD_CONFIG="$HOME/.config/hello-world.config"
if [[ -f $HELLO_WORLD_CONFIG ]] ; then
	echo removing: $HELLO_WORLD_CONFIG
	rm -f $HELLO_WORLD_CONFIG
fi
HELLO_WORLD_LOCALES="$HOME/.local/share/org.kde.servicemenus.hello-world"
if [[ -d $HELLO_WORLD_LOCALES ]] ; then
	echo removing: $HELLO_WORLD_LOCALES
	rm -rf $HELLO_WORLD_LOCALES
fi
