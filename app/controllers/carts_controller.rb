class CartsController < ApplicationController
	before_action :authenticate_user!

	def index
		@carts = session[:cart]
	end

	def show
	end

	def new
		
	end

	def edit
		
	end

	def create
		@order_quantity = params[:cart][:addquantity].to_i
		@product_id = params[:cart][:product].to_i
        if session[:cart].select {|cart| cart["product_id"] == @product_id}.present?
        	session[:cart].find{|cart| cart["product_id"] == @product_id}["quantity"] += @order_quantity
			redirect_to carts_path
		else
			ensure_cart_exists << {quantity: @order_quantity, product_id: @product_id}
			redirect_to carts_path
		end
	end

	def update
		@product_id = params[:id].to_i
		@order_quantity = params[:cart][:addquantity].to_i
		@updated_qty = session[:cart].find{|cart| cart["product_id"] == @product_id}["quantity"] - @order_quantity
		@prd_price = params[:cart][:prod_price].to_i
		@updtd_bill = params[:cart][:ttl_bill].to_i
        if session[:cart].select {|cart| cart["product_id"] == @product_id}.present?
        	session[:cart].find{|cart| cart["product_id"] == @product_id}["quantity"] = @order_quantity
			respond_to do |format|
			    format.js { render 'index.js.erb' }
			    format.html { redirect_to carts_path }
			end
		end
	end

	def destroy
		@product_id = params[:id].to_i
		session[:cart].delete_if {|cart| cart["product_id"] == @product_id}
		redirect_to carts_path
	end

end
