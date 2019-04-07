# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # protect_from_forgery with: :exception

  # GET /resource/sign_in
  # def new
  #   self.resource = resource_class.new(sign_in_params)
  #   store_location_for(resource, params[:redirect_to])
  #   super
  # end

  def after_sign_in_path_for(resource)
    resource.employee ? admin_path : root_path
    # signed_in_root_path(resource)
  end

  # def after_update_path_for(resource)
  #   signed_in_root_path(resource)
  # end

  # POST /resource/sign_in
  #  def create
  #     super
  #     logger.info("test Users::SessionsController")
  #    logger.info(sign_up_params[:email])
  #     @user = User.find_by_email(sign_up_params[:email])
  #     logger.debug " User Params:  " + @user.email
  #  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

   # protected

  # If you have extra params to permit, append them to the sanitizer.
=begin
  def sign_in_params
    params.require(:user).permit(:email, :password, :remember_me)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:user) do |u|
      u.permit(:email, :password)
    end
  end
=end
  #
  def sign_up_params
    params.require(:user).permit(:email, :password)
  end
end
