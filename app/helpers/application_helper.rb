module ApplicationHelper
	def login_helper(style = '')
		unless current_user.is_a? GuestUser
			link_to "Logout", destroy_user_session_path, method: :delete, class: style
		else
			link_to("Sign Up", new_user_registration_path, class: style) +
			' '.freeze.html_safe +
			link_to("Login", new_user_session_path, class: style)
		end
	end

	def sample_helper
		content_tag(:div, "My Content Tag Helper", class: 'my-content-tag-helper-class')
	end

	def source_helper(layout_name)
		unless session[:source].to_s.strip.freeze.empty?
			greeting =  "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout!".freeze
  			content_tag(:p, greeting, class: 'source-greeting')
		end
	end

	def copyright_generator
		DevcampViewTool123456::Renderer.copyright('sourav goswami', 'all rights reserved').html_safe
	end

	def nav_items(style, tag_type)
		[root_path, about_me_path, contact_path, tech_news_path, blogs_path, portfolios_path].zip(
			'Home * About Me * Contact * Tech News * Blogs * Portfolios'.split(?*)
		).map do |x|
			<<~EOF.tap(&:strip!)
				<#{tag_type}><a href="#{x[0]}" class="#{style} #{active?(x[0])}">#{x[1]}</a></#{tag_type}>
			EOF
		end << login_helper(style)
	end

	def nav_helper(style, tag_type)
		nav_items(style, tag_type).join.html_safe
	end

	def active?(path)
		'active' if current_page? path
	end

	def alerts
		if alert = (flash[:alert] || flash[:error] || flash[:notice])
			alert_generator(alert).html_safe
		end
	end

	def alert_generator(msg = '', button_message = 'Ok')
		%(<script>notify("#{msg}", "#{button_message}")</script>).html_safe
	end
end
