class OrdersController < ApplicationController
	before_action :authenticate_user!

	def index
		@all_orders = current_user.orders.all
	end

	def new
		
	end
	def create
		item = params[:item]
		bill = params[:bill]
		@order = Order.create(item: item, bill: bill)
		@order.user = current_user
		@order.save
		session[:cart].each do |cart|
			item_qty = cart["quantity"]
			item_id = cart["product_id"]
		    @order_detail = @order.order_details.create(quantity: item_qty, product_id: item_id)
	    end
	    session[:cart].clear
		redirect_to order_path(@order)
	end

	def show
		@order = Order.find(params[:id])
		@orderdetails = @order.order_details.all
	end
	def edit
		@order = Order.find_by(id: params[:id])
		@order.order_status = true
		@order.save
		redirect_to orders_path
	end
	def destroy
		@order = Order.find(params[:id])
		@order.destroy 
		redirect_to orders_path
	end

end
