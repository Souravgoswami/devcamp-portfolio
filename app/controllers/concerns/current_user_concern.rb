module CurrentUserConcern
	extend ActiveSupport::Concern

	included do
		before_action :current_user
	end

	def current_user
		super || guest_user
	end

	def guest_user
		guest = GuestUser.new

		guest.name = 'Guest Guest'
		guest.first_name, guest.last_name = *guest.name.split
		guest.email = "guest@guest.com"

		guest
	end
end
