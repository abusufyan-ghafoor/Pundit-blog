class ProductsController < ApplicationController
	
  def list
    @products = Product.page(params[:page])
  end

  def index
    @products = current_user.products
    authorize @products

	end

	def show
	  @product = Product.find(params[:id])
    @comment = Comment.new(product_id: @product.id)
    
	end

	def new
	  @product = Product.new
    @categories = Category.all.map{|c| [ c.name, c.id ] }
    authorize @product
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all.map{|c| [ c.name, c.id ] }
    authorize @product
  end 

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    authorize @product
    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.category_id = params[:product][:category_id]
    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end
    
    def destroy
    @product = Product.find(params[:id])
    @product.destroy 
    redirect_to products_path
  end

  def search
    if params[:search].blank?
      redirect_to root_path
    else
      @parameter = params[:search].downcase
      @results = Product.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
    end
  end


  
    private
    def product_params
      params.require(:product).permit(:name, :description, :price, :category_id, :quantity, {avatars: []})
    end

end
