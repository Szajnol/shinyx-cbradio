fx_version 'cerulean'
game 'gta5'
version '1.0.0'

client_scripts {
	'client.lua',
}
ui_page {
	'html/index.html'
}
files {
	'html/index.html',
	'html/css/style.css',
	'html/css/*.woff',
	'html/sfx/*.mp3',
	'html/js/fivem.js',
	'html/*.png'
}

dependency 'es_extended'
lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
}

