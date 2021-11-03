class ReviewsController < ApplicationController
	def index
		
	end
	def new
		
	end
	def create
	  @product = Product.find(params[:product_id])
	  @review = @product.reviews.create(review_params.merge(user_id: current_user.id))
	  redirect_to product_path(@product)
	end
	def update
		
	end
	def destroy
		
	end
	private
    def review_params
      params.require(:review).permit(:rating)
    end
end
