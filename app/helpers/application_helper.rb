module ApplicationHelper
  def app_name
    "Hisab"
  end

  def active_controller(name)
    controller_name.eql?(name)
  end
end
