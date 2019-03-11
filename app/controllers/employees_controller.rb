class EmployeesController < ApplicationController
  layout "sidenav"

  before_action :set_view
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  def index
    @employees = Employee.all
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :phone, :dni, :direction, :hire_date, :dismissal_date, :role)
    end

    def set_view
      @body_class = "with-sidebar show-sidebar"
    end
end
