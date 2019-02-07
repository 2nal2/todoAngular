class CustomersController < ApplicationController
  layout "sidenav"

  before_action :set_view
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  def show
    respond_to do |format|
      format.json
      format.html
    end
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  def create
    @customer = Customer.new(customer_params)

    if @customer.type_customer == 'n'
      @customer.organization = nil
    else
      @customer.person = nil
    end

    if @customer.save
      flash[:notice] = "Cliente registrado exitosamente"
      response = {success: true}
    else
      response = {success: false, errors: @customer.errors, full_message: @customer.errors.full_messages}
    end

    respond_to do |format|
      format.json {render  json: response }
    end
  end

  # PATCH/PUT /customers/1
  def update

    @customer = Customer.new(customer_params)

    if @customer.type_customer == 'n'
      @customer.organization = nil
    else
      @customer.person = nil
    end

    if @customer.update
      flash[:notice] = "Cliente actualizado exitosamente"
      response = {success: true}
    else
      response = {success: false, errors: @customer.errors, full_message: @customer.errors.full_messages}
    end

    respond_to do |format|
      format.json {render  json: response }
    end
    # if @customer.update(customer_params)
    #   redirect_to @customer, notice: 'Customer was successfully updated.'
    # else
    #   render :edit
    # end
  end

  # DELETE /customers/1
  def destroy
    @customer.destroy
    redirect_to customers_url, notice: 'Customer was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def customer_params
      params.require(:customer).permit(:province_id, :phone, :email, :preferential_price, :discount, :exonerate_iva,
                                       :exonerate_1, :exonerate_2, :credit_limit, :credit_time_limit, :interest_rate,
                                       :direction, :comments, :status, :user_id, :type_customer,
                                       person_attributes: [:id, :first_name, :last_name, :dni],
                                       organization_attributes: [:id, :name, :ruc, :representan_phone, :representant_name, :backup_name, :backup_phone])
    end

    def set_view
      @body_class = "with-sidebar show-sidebar"
    end
end
