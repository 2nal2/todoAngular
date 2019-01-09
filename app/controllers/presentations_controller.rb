class PresentationsController < ApplicationController
  layout "scaffold"

  before_action :set_presentation, only: [:show, :edit, :update, :destroy]

  # GET /presentations
  def index
    @presentations = Presentation.all
  end

  # GET /presentations/1
  def show
  end

  # GET /presentations/new
  def new
    @presentation = Presentation.new
  end

  # GET /presentations/1/edit
  def edit
  end

  # POST /presentations
  def create
    @presentation = Presentation.new(presentation_params)

    if @presentation.save
      redirect_to @presentation, notice: 'Presentation was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /presentations/1
  def update
    if @presentation.update(presentation_params)
      redirect_to @presentation, notice: 'Presentation was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /presentations/1
  def destroy
    @presentation.destroy
    redirect_to presentations_url, notice: 'Presentation was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presentation
      @presentation = Presentation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def presentation_params
      params.require(:presentation).permit(:measure_id, :name)
    end
end
