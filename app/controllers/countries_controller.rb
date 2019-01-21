class CountriesController < ApplicationController
  # layout "scaffold"
  layout "sidenav"
  before_action :set_country, only: [:show, :edit, :update, :destroy]
  before_action :set_view

  # GET /countries
  def index
    @countries = Country.all
  end

  #Get /countries/active
  def active
    @countries = Country.where(status:true)
    respond_to do |format|
      format.json
    end
  end

  # GET /countries/1
  def show
    @provinces = @country.provinces.search(params[:search])
  end

  # GET /countries/new
  def new
    @country = Country.new
    @country.status = true
  end

  # GET /countries/1/edit
  def edit
  end

  # POST /countries
  def create
    @country = Country.new(country_params)

    if @country.save
      redirect_to @country, notice: 'Country was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /countries/1
  def update
    if @country.update(country_params)
      redirect_to @country, notice: 'Country was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /countries/1
  def destroy
    @country.destroy
    redirect_to countries_url, notice: 'Country was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def country_params
      params.require(:country).permit(:name, :status)
    end

    def set_view
      @body_class = "with-sidebar show-sidebar"
    end
end
