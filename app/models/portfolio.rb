class Portfolio < ApplicationRecord
	include Placeholder

	# bundle add acts_as_list
	# yarn add sortablejs stimulus
	# modify /app/javascript/controllers/drag_controller.js
	# Add acts_as_list
	acts_as_list

	has_many :technologies

	validates_presence_of :title, :body, :main_image, :thumb_image
	after_initialize :set_defaults
	accepts_nested_attributes_for :technologies, reject_if: -> attrs { attrs['name'].blank? }

	def self.angular
		where(subtitle: 'Angular')
	end

	def self.by_position
		self.order('position ASC')
	end

	scope(
		:rails, proc {
			where(subtitle: 'Ruby on Rails')
		}
	)

	def set_defaults
		# self.main_image ||= Placeholder.image_generator(height: 640, width: 480)
		self.main_image ||= "https://i.imgur.com/vQfNBFJ.gif".freeze
		self.thumb_image ||= "https://i.imgur.com/DXOkOtm.jpg".freeze
	end
end
