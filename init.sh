#!/bin/bash

CONFIG_PATH=~/.hammerspoon

echo -e "\033[1;33m" 

mkdir -p ${CONFIG_PATH}
mkdir -p ${CONFIG_PATH}/Spoons

# Copy init.lua to ${CONFIG_PATH}
# If init.lua already exists in your mac, append it.
if [ ! -e ${CONFIG_PATH}/init.lua ] 
then
	echo "init.lua is copied at ~/.hammerspoon"
	cp ./hammerspoon_config/init.lua ${CONFIG_PATH}/init.lua
else
	echo "New settings are appended in your init.lua"
	cat ./hammerspoon_config/init.lua >> ${CONFIG_PATH}/init.lua
fi

if [ ! -d ${CONFIG_PATH}/modules ]
then
	cp -rf ./hammerspoon_config/modules ${CONFIG_PATH}/modules
else
	if [ -e ${CONFIG_PATH}/vim_keymap.lua ]
	then
		mv ${CONFIG_PATH}/vim_keymap.lua ${CONFIG_PATH}/vim_keymap.lua_backup
	fi
	cp ./hammerspoon_config/vim_keymap.lua ${CONFIG_PATH}/vim_keymap.lua

	if [ -e ${CONFIG_PATH}/change_input_source_if_ko.lua ]
	then
		mv ${CONFIG_PATH}/change_input_source_if_ko.lua ${CONFIG_PATH}/change_input_source_if_ko.lua_backup
	fi
	cp ./hammerspoon_config/change_input_source_if_ko.lua ${CONFIG_PATH}/change_input_source_if_ko.lua
fi

echo -e "Please remove this directory(vimlife_with_hammerspoon) 👍"
echo -e "\033[0m"