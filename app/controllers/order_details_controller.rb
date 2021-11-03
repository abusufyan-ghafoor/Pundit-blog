class OrderDetailsController < ApplicationController
	def index
		@orderdetails = OrderDetail.all
	end
	def new
		
	end
	def create
		
	end

	def update
		
	end

	def destroy
		@orderdetail = OrderDetail.find(params[:id])
		@orderdetail.destroy
		redirect_to :back
	end


end
