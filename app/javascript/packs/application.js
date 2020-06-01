require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('turbolinks')

import 'bootstrap'
import '@fortawesome/fontawesome-free/js/all'
import '../stylesheets/application'

document.addEventListener('turbolinks:load', () => {
	$('[data-toggle="tooltip"]').tooltip()
	$('[data-toggle="popover"]').popover()
})

import 'jquery-ui'
$(
	() => {
		$('.sortable').sortable()
	}
)

import "controllers"
import 'cocoon-js'
import './notify-send.js'

// Load all the js file in a directory...
// ; (ctx => ctx.keys().forEach(ctx))(require.context('.', true, /\.js$/))
