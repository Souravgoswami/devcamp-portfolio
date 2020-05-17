module PortfoliosHelper
	def login_helper(style = '')
		unless current_user.is_a? GuestUser
			link_to "Logout", destroy_user_session_path, method: :delete, class: style
		else
			link_to("Sign Up", new_user_registration_path, class: style) +
			' | '.freeze.html_safe +
			link_to("Login", new_user_session_path, class: style)
		end
	end
end
