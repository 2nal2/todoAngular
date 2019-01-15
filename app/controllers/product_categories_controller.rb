class ProductCategoriesController < ApplicationController
  # layout "scaffold"
  layout 'sidenav'
  before_action :set_product_category, only: [:show, :edit, :update, :destroy]
  before_action :set_view
  # GET /product_categories
  def index

    if params[:format] == 'xlsx'
      @product_categories = ProductCategory.search(params[:search])
    else
      @product_categories = ProductCategory.search(params[:search]).paginate(page: params[:page], per_page: 15)
    end

    respond_to do |format|
      format.xlsx {
        response.headers[
            'Content-Disposition'
        ] = "attachment; filename='categorias-#{ Time.zone.now.strftime("%m%d%Y") }.xlsx'"
      }
      format.html
    end
  end

  # GET /product_categories/1
  def show
  end

  # GET /product_categories/new
  def new
    @product_category = ProductCategory.new
  end

  # GET /product_categories/1/edit
  def edit
  end

  # POST /product_categories
  def create
    @product_category = ProductCategory.new(product_category_params)

    if @product_category.save
      redirect_to @product_category, notice: 'Product category was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /product_categories/1
  def update
    if @product_category.update(product_category_params)
      redirect_to @product_category, notice: 'Product category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /product_categories/1
  def destroy
    @product_category.destroy
    redirect_to product_categories_url, notice: 'Product category was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product_category
    @product_category = ProductCategory.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def product_category_params
    params.require(:product_category).permit(:name, :status)
  end

  def set_view
    @body_class = "with-sidebar show-sidebar"
  end
end
