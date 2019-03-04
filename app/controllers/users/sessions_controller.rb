# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  # GET /resource/sign_in
  def new
     @user = User.all
     super
  end

  # POST /resource/sign_in
   def create
     # super
      logger.info("test Users::SessionsController")
     # logger.info(:sign_in_params)
     # @user = User.new(:sign_in_params)
     # logger.debug " User Params:  " + @user.email
   end

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
  # def sign_up_params
  #     params.require(:user).permit(:email, :password, :password_confirmation)
  #   end
end
