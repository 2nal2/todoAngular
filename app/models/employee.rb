class Employee < ApplicationRecord
  has_one :user

  def role_name
    {
        "admin" =>"administrador",
        "cajero" => "cajero",
        "admin_inventario" => "Administrador de inventario"
    }[role]
  end
end

