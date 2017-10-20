client_script 'client.lua'
client_script 'menu.lua'
client_script 'utils.lua'
server_scripts {
	'server.lua',
}

-- Client Scripts
client_script 'client/main.lua'

-- Server Scripts
server_script 'server/main.lua'


ui_page 'client/html/index.html'

files({
    'client/html/index.html',
    -- Begin Sound Files Here...
    'client/html/sounds/lock.ogg',
    'client/html/sounds/unlock.ogg',
    'client/html/sounds/demo.ogg'
})