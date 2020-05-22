const { environment } = require('@rails/webpacker')

const webpack = require('webpack')

environment.plugins.append('Provide', new webpack.ProvidePlugin({
	$: 'jquery',
	jQuery: 'jquery',
	Popper: ['popper.js', 'default'],
	'window.jQuery': 'jquery',
	'window.$': 'jquery'
}))

const aliasConfig = {
	'jqeury': 'jquery-ui-dist/external/jquery.js',
	'jqueyr-ui': 'jquery-ui/dist/jquery-ui.js'
}

environment.config.set('resolve.alias', aliasConfig)

module.exports = environment
