#! /usr/bin/env bash
# hello-world/uninstall-extras.sh
# remove the config file if present
HELLO_WORLD_CONFIG=$HOME/.config/hello-world.config
if [[ -f $HELLO_WORLD_CONFIG ]];
	rm $HELLO_WORLD_CONFIG
fi
