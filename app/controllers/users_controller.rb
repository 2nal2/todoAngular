class UsersController < ApplicationController
  layout "sidenav"
  
  before_action :set_view

  def index
    if params[:format] == "xlsx"
      @users = User.search(params[:search])
    else
      @users = User.search(params[:search]).paginate(page: params[:page], per_page: 15)
    end

    respond_to do |format|
      format.xlsx {
        response.headers[
          "Content-Disposition"
        ] = "attachment; filename=empleados-#{Time.zone.now.strftime("%m%d%Y")}.xlsx"
      }
      format.html
    end
  end

  private

  def set_view
    @body_class = "with-sidebar show-sidebar"
  end
end
