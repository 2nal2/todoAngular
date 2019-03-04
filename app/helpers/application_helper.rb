module ApplicationHelper
  def app_name
    "Hisab"
  end

  def active_controller(name)
    controller_name.eql?(name)
  end

  def resource_name
    :user
  end

  def resource
    @user ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
