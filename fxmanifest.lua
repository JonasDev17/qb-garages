fx_version 'cerulean'
game 'gta5'

description 'QB-Garages'
version '1.0.0'

shared_scripts { 
	'@qb-core/import.lua',
	'SharedConfig.lua',
}

client_scripts {
    'client/main.lua',
    'client/gui.lua',
}

server_script 'server/main.lua'