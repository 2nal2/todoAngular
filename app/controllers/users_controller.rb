class UsersController < ApplicationController
  # layout "scaffold"
  # GET /product_categories
  def index
  end

  def activate_user
    vars = request.query_parameters
    @code = vars['activation_code']
    @user = User.where('activation_code = :activation',{ activation: @code })
    @user.update(:activation_code => '')
    redirect_to user_session_path
    #format.json render => @user.nil? ? {:message => :ok} : {:message => :failed}
  end

  # GET /product_categories/1
  def show
  end

  # GET /product_categories/new
  def new
    @user = User.new
  end

  # GET /product_categories/1/edit
  def edit
  end

  # POST /product_categories
  def create
  end

  # PATCH/PUT /product_categories/1
  def update
  end

  # DELETE /product_categories/1
  def destroy
  end

  private

end
