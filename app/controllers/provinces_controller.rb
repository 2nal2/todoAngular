class ProvincesController < ApplicationController
  layout "sidenav"

  before_action :set_country
  before_action :set_province, only: [:show, :edit, :update, :destroy]

  # GET /provinces
  def index
    @provinces = @country.provinces.all

  end

  # GET /provinces/1
  def show
  end

  # GET /countries/1/provinces/active
  def active
    @provinces = @country.provinces.where(status:true)

    respond_to do |format|
      format.json
    end
  end
  # GET /provinces/new
  def new
    @province = @country.provinces.new
    @province.status = true
  end

  # GET /provinces/1/edit
  def edit
  end

  # POST /provinces
  def create
    @province = @country.provinces.new(province_params)

    if @province.save
      redirect_to @country, notice: 'Departamento/Provincia agregada exitosamente'
    else
      render :new
    end
  end

  # PATCH/PUT /provinces/1
  def update
    if @province.update(province_params)
      redirect_to  @country, notice: 'Departamento/Provincia actualizada exitosamente'
    else
      render :edit
    end
  end

  # DELETE /provinces/1
  def destroy
    @province.destroy
    redirect_to provinces_url, notice: 'Province was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_province
      @province = Province.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def province_params
      params.require(:province).permit(:country_id, :name, :status)
    end

    def set_country
      @country = Country.find(params[:country_id])
    end
end
