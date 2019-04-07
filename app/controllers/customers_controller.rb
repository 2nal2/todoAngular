class CustomersController < ApplicationController
  layout "sidenav"

  before_action :set_view
  before_action :set_customer, only: [:show, :edit, :update, :destroy, :create_user, :new_user, :edit_user, :update_user]

  # GET /customers
  def index
    if params[:format] == "xlsx"
      @customers = Customer.search(params[:search])
    else
      @customers = Customer.search(params[:search]).paginate(page: params[:page], per_page: 15)
    end

    respond_to do |format|
      format.xlsx {
        response.headers[
          "Content-Disposition"
        ] = "attachment; filename=clientes-#{Time.zone.now.strftime("%m%d%Y")}.xlsx"
      }
      format.html
    end
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

    if @customer.type_customer == "n"
      @customer.organization = nil
    else
      @customer.person = nil
    end

    if @customer.save
      flash[:notice] = "Cliente registrado exitosamente"
      response = { success: true }
    else
      response = { success: false, errors: @customer.errors, full_message: @customer.errors.full_messages }
    end

    respond_to do |format|
      format.json { render json: response }
    end
  end

  # PATCH/PUT /customers/1.json
  def update
    if @customer.type_customer == "n"
      customer_params[:person_attributes] = nil
    else
      customer_params[:organization_attributes] = nil
    end

    if @customer.update(customer_params)
      flash[:notice] = "Cliente actualizado exitosamente"
      response = { success: true }
    else
      response = { success: false, errors: @customer.errors, full_message: @customer.errors.full_messages }
    end

    respond_to do |format|
      format.json { render json: response }
    end
  end

  # DELETE /customers/1
  def destroy
    # @customer.destroy
    redirect_to customers_url, notice: "Funcionalidad desactivada"
  end

  def create_user
    @user = User.create(user_params)
    @user.customer = @customer

    if @user.save
      redirect_to @customer, notice: "Usuario creado exitosamente"
    else
      render :new_user
    end
  end

  def update_user
    @user = @customer.user

    if user_params[:password] == user_params[:password_confirmation] && user_params[:password] == ""
      if @user.update_attribute(:email, user_params[:email])
        redirect_to @customer, notice: "Usuario actualizado exitosamente"
      else
        render :edit_user
      end
      return
    end

    if @user.update(user_params)
      redirect_to @customer, notice: "Usuario actualizado exitosamente"
    else
      render :edit_user
    end
  end

  def new_user
    @user = User.new
  end

  def edit_user
    @user = @customer.user
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
                                     organization_attributes: [:id, :name, :ruc, :representant_phone, :representant_name, :backup_name, :backup_phone])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def set_view
    @body_class = "with-sidebar show-sidebar"
  end
end
