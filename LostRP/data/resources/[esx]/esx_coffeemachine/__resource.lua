dependency 'essentialmode'
client_script{'clientcoffee.lua',
	'guicoffee.lua',
}

server_script 'servercoffee.lua'
server_script '@mysql-async/lib/MySQL.lua'
