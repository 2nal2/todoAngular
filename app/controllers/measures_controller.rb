class MeasuresController < ApplicationController
  # layout "scaffold"
  layout "sidenav"
  before_action :set_measure, only: [:show, :edit, :update, :destroy]
  before_action :set_view

  # GET /measures
  def index
    @measures = Measure.all
  end

  # GET /measures/1
  def show
  end

  # GET /measures/new
  def new
    @measure = Measure.new
  end

  # GET /measures/1/edit
  def edit
  end

  # POST /measures
  def create
    @measure = Measure.new(measure_params)

    if @measure.save
      redirect_to @measure, notice: 'Unidad de medida creada correctamente'
    else
      render :new
    end
  end

  # PATCH/PUT /measures/1
  def update
    if @measure.update(measure_params)
      redirect_to @measure, notice: 'Unidad de medida actualizada correctamente'
    else
      render :edit
    end
  end

  # DELETE /measures/1
  def destroy
    @measure.destroy
    redirect_to measures_url, notice: 'Measure was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measure
      @measure = Measure.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def measure_params
      params.require(:measure).permit(:name, :code, :status)
    end

    def set_view
      @body_class = "with-sidebar show-sidebar"
    end
end
