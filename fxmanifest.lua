fx_version 'cerulean'
game 'gta5'

author 'Drie'
description 'qb-gunshop for QBCore Created By Drie'
version '1'

shared_scripts {
    'config.lua',
}

client_scripts {
	'client/main.lua',
	'client/menus.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua'
}
