class PortfoliosController < ApplicationController
	def index
		@portfolio_items = Portfolio.all
	end

	def new
		@portfolio_item = Portfolio.new
	end

	def create
		@portfolio = Portfolio.new(params.require(:portfolio).permit(:title, :body))

		respond_to do |fmt|
			if @portfolio.save
				fmt.html { redirect_to @portfolio, notice: 'Your post is now live!' }
				# format.html { redirect_to portfolios_path, notice: 'Your post is now live!' }
			else
				fmt.html { render :new }
			end
		end
	end
end
