class ProductPricesController < ApplicationController
  layout "sidenav"
  before_action :set_view
  before_action :set_product
  before_action :set_product_price, only: [:show, :edit, :update, :destroy]

  # GET /product_prices
  def index
    @product_prices = @product.product_prices.all
  end

  # GET /product_prices/1
  def show
  end

  # GET /product_prices/new
  def new
    @product_price = @product.product_prices.new
    @product_price.status = true
  end

  # GET /product_prices/1/edit
  def edit
  end

  # POST /product_prices
  def create
    @product_price = ProductPrice.new(product_price_params)
    @product_price.product_id = @product.id

    if @product_price.save
      redirect_to @product, notice: 'Precio registrado exitosamente.'
    else
      render :new
    end
  end

  # PATCH/PUT /product_prices/1
  def update
    if @product_price.update(product_price_params)
      redirect_to @product, notice: 'Precio actualizado exitosamente.'
    else
      render :edit
    end
  end

  # DELETE /product_prices/1
  def destroy
    @product_price.destroy
    redirect_to product_prices_url, notice: 'Product price was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product_price
    @product_price = ProductPrice.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def product_price_params
    params.require(:product_price).permit(:product_id, :price_public, :price_farmacy, :price_distribution, :start_date, :end_date, :status)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_view
    @body_class = "with-sidebar show-sidebar"
  end
end
