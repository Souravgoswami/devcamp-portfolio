require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require('turbolinks')
require('webpack-jquery-ui')
require('webpack-jquery-ui/css')

import 'bootstrap'
import '@fortawesome/fontawesome-free/js/all'

require('webpack-jquery-ui')
require('webpack-jquery-ui/css')

import '../stylesheets/application'

document.addEventListener('turbolinks:load', () => {
	$('[data-toggle="tooltip"]').tooltip()
	$('[data-toggle="popover"]').popover()
})

import './html5sortable'
// ; (ctx => ctx.keys().forEach(ctx))(require.context('.', true, /\.js$/))
