class Portfolio < ApplicationRecord
	# bundle add acts_as_list
	# yarn add sortablejs
	# rails webpacker:install:stimulus
	# modify /app/javascript/controllers/drag_controller.js
	# Add acts_as_list
	acts_as_list

	has_many :technologies

	validates_presence_of :title, :body
	accepts_nested_attributes_for :technologies, reject_if: -> attrs { attrs['name'].blank? }

	mount_uploader :thumb_image, PortfolioUploader
	mount_uploader :main_image, PortfolioUploader

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
end
