module DeviseWhitelist
	extend ActiveSupport::Concern

	included do
		before_action :configure_permitted_parameters
	end
end
