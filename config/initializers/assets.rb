Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.paths << Rails.root.join('node_modules')

Rails.application.config.assets.precompile.concat(%w[
	blogs.scss
	portfolios.scss
])
