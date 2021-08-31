class ProductsController < ApplicationController
  load_and_authorize_resource
  PRODUCT_PER_PAGE = 3

  def index
    @cart = current_user&.cart
      if params[:filter] || params[:filter1]
        @filter0 = params[:filter]
        @filter1 = params[:filter1]
        @products = Product.between_range(@filter0,@filter1)
      else
        @page = params.fetch(:page, 0).to_i
        @products = Product.offset(@page*PRODUCT_PER_PAGE).limit(PRODUCT_PER_PAGE)
    end
  end

  def show
  end

  def new
     @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
      if @product.save
        redirect_to @product, notice: 'Product was successfully created.'
      else
        render :new
      end
  end

  def edit
     @product = Product.find(params[:id])
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.' 
  end

  private
    def product_params
      params.require(:product).permit(:product_name, :description, :price, :image)
    end
end