class PortfoliosController < ApplicationController
	layout 'portfolio'

	def index
		# @portfolio_items = Portfolio.angular #.where(subtitle: 'Angular')
		# @portfolio_items =Portfolio.rails
		@portfolio_items = Portfolio.all
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
		@portfolio_item = Portfolio.find(params[:id])
		3.times { @portfolio_item.technologies.build }
	end

	def update
		@portfolio_item = Portfolio.find(params[:id])

		respond_to do |fmt|
			if @portfolio_item.update(portfolio_params)
				fmt.html { redirect_to portfolios_path, notice: 'The record was successfully updated' }
			else
				fmt.html { render :edit }
			end
		end
	end

	def show
		@item = Portfolio.find(params[:id])
	end

	def destroy
		@item = Portfolio.find(params[:id])
		@item.destroy

		respond_to do |fmt|
			fmt.html { redirect_to portfolios_url, notice: 'The record was successfully removed!' }
		end
	end

	private
	def portfolio_params
		params.require(:portfolio).permit(
			:title, :subtitle, :body, :main_image, :thumb_image,
			technologies_attributes: [:name]
		)
	end
end
