class EmployeesController < ApplicationController
  layout "sidenav"

  before_action :set_view
  before_action :set_employee, only: [:show, :edit, :update, :destroy, :create_user, :new_user, :edit_user, :update_user]

  # GET /employees
  def index
    # @employees = Employee.all
    if params[:format] == 'xlsx'
      @employees = Employee.search(params[:search])
    else
      @employees = Employee.search(params[:search]).paginate(page: params[:page], per_page: 1)
    end

    respond_to do |format|
      format.xlsx {
        response.headers[
            'Content-Disposition'
        ] = "attachment; filename=empleados-#{ Time.zone.now.strftime("%m%d%Y") }.xlsx"
      }
      format.html
    end
  end

  # GET /employees/1
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to @employee, notice: 'Empleado creado exitosamente'
    else
      render :new
    end
  end

  # PATCH/PUT /employees/1
  def update
    if @employee.update(employee_params)
      redirect_to @employee, notice: 'Empleado actualizado exitosamente'
    else
      render :edit
    end
  end

  # DELETE /employees/1
  def destroy
    # @employee.destroy
    # redirect_to employees_url, notice: 'Employee was successfully destroyed.'
  end

  def create_user
    @user = User.create(user_params)
    @user.employee = @employee

    if @user.save
      redirect_to @employee, notice: 'Usuario creado exitosamente'
    else
      render :new_user
    end
  end

  def update_user
    @user = @employee.user

    if user_params[:password] == user_params[:password_confirmation] && user_params[:password] == ""
      if @user.update_attribute(:email, user_params[:email])
        redirect_to @employee, notice: 'Usuario actualizado exitosamente'
      else
        render :edit_user
      end
      return
    end

    if @user.update(user_params)
      redirect_to @employee, notice: 'Usuario actualizado exitosamente'
    else
      render :edit_user
    end
  end

  def new_user
    @user = User.new
  end

  def edit_user
    @user = @employee.user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :phone, :dni, :direction, :status, :role)
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def set_view
      @body_class = "with-sidebar show-sidebar"
    end
end
