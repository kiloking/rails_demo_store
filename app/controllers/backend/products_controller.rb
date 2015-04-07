class Backend::ProductsController < Backend::BaseController
  before_action :find_product, only:[:show, :edit, :update, :destroy]
  
  def index
    # TODO
    @product = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to backend_products_path
    else
      render :new
    end
  end

  def edit
    # TODO
  end

  def update
    # TODO
      if @product.update(product_params)

        redirect_to backend_products_path
      else
        render :edit
      end

  end

  def destroy
    #render text: params
    # TODO
    @product.destroy
    redirect_to backend_products_path

  end

  def find_product
    @product = Product.find(params[:id]) #抽出商品id
      
  end 

  def product_params
    params.require(:product).permit(:name, :description, :price, :is_online, :image)
  end
end
