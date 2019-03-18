class Employee < ApplicationRecord
  has_one :user

  validates :dni, uniqueness: true, length: {minimum: 1, maximum: 255}
  validates :first_name, presence: true, length: {minimum: 1, maximum: 255}
  validates :last_name, presence: true, length: {minimum: 1, maximum: 255}
  validates :role, presence: true, length: {minimum: 1, maximum: 255}

  def role_name
    {
        "admin" => "administrador",
        "cajero" => "cajero",
        "admin_inventario" => "Administrador de inventario"
    }[role]
  end

  def full_name
    return first_name + " " + last_name
  end

  def self.search text
    if text && text != ''
      where("concat(first_name. ' ', last_name) like :param OR
            dni like :param_id", {param: "%#{text}%", param_id: "#{text}%"})
    else
      all
    end
  end

end

