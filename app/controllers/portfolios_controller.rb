class PortfoliosController < ApplicationController
	layout 'portfolio'
	before_action :set_portfolio_item, only: [:edit, :show, :update, :destroy, :move]
	access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

	def index
		# @portfolio_items = Portfolio.angular #.where(subtitle: 'Angular')
		# @portfolio_items =Portfolio.rails
		# @portfolio_items = Portfolio.all

		# @portfolio_items = Portfolio.order('position ASC')
		@portfolio_items = Portfolio.by_position
	end

	def angular
		@portfolio_items = Portfolio.angular
	end

	def rails
		@portfolio_items = Portfolio.rails
	end

	def new
		@portfolio_item = Portfolio.new

		3.times do
			@portfolio_item.technologies.build
		end
	end

	def create
		@portfolio_item = Portfolio.new(portfolio_params)

		respond_to do |fmt|
			if @portfolio_item.save
				fmt.html { redirect_to portfolios_path, notice: 'Your portfolio is now live!' }
			else
				fmt.html { render :new }
			end
		end
	end

	def edit
		3.times { @portfolio_item.technologies.build }
	end

	def update
		respond_to do |fmt|
			if @portfolio_item.update(portfolio_params)
				fmt.html { redirect_to portfolios_path, notice: 'The record was successfully updated' }
			else
				fmt.html { render :edit }
			end
		end
	end

	def show
	end

	def destroy
		@portfolio_item.destroy

		respond_to do |fmt|
			fmt.html { redirect_to portfolios_url, notice: 'The record was successfully removed!' }
		end
	end

	def move
		@portfolio_item.insert_at(params[:position].to_i)
	end

	private

	def portfolio_params
		params.require(:portfolio).permit(
			:title, :subtitle, :body, :main_image, :thumb_image,
			technologies_attributes: [:name]
		)
	end

	def set_portfolio_item
		@portfolio_item = Portfolio.find(params[:id])
	end
end
