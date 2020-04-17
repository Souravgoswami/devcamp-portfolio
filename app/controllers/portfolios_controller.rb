class PortfoliosController < ApplicationController
	def index
		@portfolio_items = Portfolio.all
	end

	def new
		@portfolio_item = Portfolio.new
	end

	def create
		@portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :body))

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
	end

	def update
		@portfolio_item = Portfolio.find(params[:id])

		respond_to do |fmt|
			if @portfolio_item.update(params.require(:portfolio).permit(:title,  :subtitle, :body))
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
end
