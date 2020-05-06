module ApplicationHelper
	def login_helper
		if current_user.is_a? User
			link_to "Logout", destroy_user_session_path, method: :delete
		else
			link_to("Sign Up", new_user_registration_path) +
			'<br>'.freeze.html_safe +
			link_to("Login", new_user_session_path)
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
end
