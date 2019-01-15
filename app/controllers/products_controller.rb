class ProductsController < ApplicationController
  # layout "scaffold"
  layout "sidenav"
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_view

  # GET /products
  def index
    @products = Product.search(params[:search]).paginate(page: params[:page], per_page: 15)
  end

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    @categories = ProductCategory.where(status: true)
    @measures = Measure.where(status: true)
  end

  # GET /products/1/edit
  def edit
    @categories = ProductCategory.where(status: true)
    @measures = Measure.where(status: true)
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: 'Producto creado exitosamente'
    else
      render :new
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Producto actualizado exitosamente'
    else
      render :edit
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:product_category_id, :name, :bar_code, :has_iva, :need_prescription, :stock, :min_stock, :cost, :measure, :measure_id, :description, :status, :image)
    end

    def set_view
      @body_class = "with-sidebar show-sidebar"
    end
end
