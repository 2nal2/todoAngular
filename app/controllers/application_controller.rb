class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    # devise_parameter_sanitizer.for(:sign_up) << :role
    # devise_parameter_sanitizer.for(:sign_up) << :first_name
    # devise_parameter_sanitizer.for(:sign_up) << :last_name
    # # devise_parameter_sanitizer.for(:account_update) << :role
    # 	# devise_parameter_sanitizer.for(:sign_up) << [:first_name,:last_name,:email, :password, :password_confirmation, :role]
    #   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name,:last_name,:email, :password, :role) }
    # binding.pry
  end
end
