class Portfolio < ApplicationRecord
	validates_presence_of :title, :body, :main_image, :thumb_image
	after_initialize :set_defaults

	def self.angular
		where(subtitle: 'Angular')
	end

	scope(
		:rails, proc {
			where(subtitle: 'Ruby on Rails')
		}
	)

	def set_defaults
		self.main_image ||= "https://i.imgur.com/vQfNBFJ.gif".freeze
		self.thumb_image ||= "https://i.imgur.com/DXOkOtm.jpg".freeze
	end
end
