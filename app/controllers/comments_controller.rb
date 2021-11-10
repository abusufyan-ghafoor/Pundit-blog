class CommentsController < ApplicationController
	def index
		@comments = Comment.page(params[:page]).per(3)
	end
	def show
		@comment = Comment.find(params[:id])
		if @comments.blank?
		      @avg_review = 0
		    else
		      @avg_review = @comments.average(:rating)
		end
	end
	def new
		@comment = Comment.new
		authorize @comment
	end
	def edit
		@comment = Comment.find(params[:id])
	end
	def create
		@product = Product.find(params[:product_id])
	  @comment = @product.comments.create(comment_params.merge(user_id: current_user.id))
	  authorize @comment
	  @obj = {
	          id: @comment.id,
	          description: @comment.description,
	          user_id: @comment.user_id,
	          product_id: @comment.product_id,
	          display_name: @comment.user.name
	        }.as_json

	        CommentBroadcastJob.perform_later(
	          @comment.product, 
	          render_to_string(
	            partial: 'comments/comment',
	            locals: {
	              comment: @obj
	            } 
	          )
	        )
	  redirect_to product_path(@product)
	end
	def destroy
		@product = Product.find(params[:product_id])
		@comment = @product.comments.find(params[:id])
		@comment.destroy
    redirect_to product_path(@product)
	end

	private
    def comment_params
      params.require(:comment).permit(:rating, :description)
    end
end
