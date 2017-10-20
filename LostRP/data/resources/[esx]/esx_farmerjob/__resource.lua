resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Fermier'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
    '@es_extended/locale.lua',
	'server/esx_farmerjob.server.lua',
	'locales/fr.lua',
	'config.lua'
}

client_scripts {
    '@es_extended/locale.lua',
	'client/esx_farmerjob.client.lua',
	'client/esx_farmerjob_boss.client.lua',
	'locales/fr.lua',
	'config.lua'
}