class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  # GET /users/sign_up
  def new
    @instruments = User.all
    super
  end

  # POST /resource
=begin
  def create
    @user = User.new(params[:user])
    logger.info('creating user')
    respond_to do |format|
    super
  end
=end

  def create
    @user = User.new(sign_up_params)
    puts @user.inspect
    respond_to do |format|
      if @user.save!
        format.html { redirect_to root_url }
        format.json { render :json => @user, status: :created }
      else
        format.html { render action: "new" }
        format.json { render :json => @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /resource/edit
  def edit
    @instruments = User.all
    @resources = Resource.all
    super
  end

  # PUT /resource
  def update
    @instruments = Instrument.all
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
=begin
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation])
  end
=end


  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end