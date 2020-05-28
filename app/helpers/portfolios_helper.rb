module PortfoliosHelper
	def login_helper(style = '')
		unless current_user.is_a? GuestUser
			link_to "Logout", destroy_user_session_path, method: :delete, class: style
		else
			link_to("Sign Up", new_user_registration_path, class: style) +
			'<span class="my-2">|</span>'.freeze.html_safe +
			link_to("Login", new_user_session_path, class: style)
		end
	end

	def image_generator(width:, height:)
		"https://placehold.it/#{height}x#{width}"
	end

	def portfolio_img(img, type)
		if img || img &.model &.main_image? || img &.model &.thumb_image?
			img
		elsif type == 'thumb'
			image_generator(height: '300', width: '300')
		else
			image_generator(width: '500', height: '500')
		end
	end
end
