class User < ApplicationRecord
  belongs_to :employee, optional: true
  belongs_to :customer, optional: true

  validates_associated :employee
  validates_associated :customer

  validates :email, presence: true, uniqueness: true
  validates :employee_id, uniqueness: true, allow_nil: true
  validates :customer_id, uniqueness: true, allow_nil: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :timeoutable,
         :validatable,
         :lockable,
         :confirmable

  has_secure_token :activation_code

  def role
    if employee_id
      employee.role_name
    else
      'cliente'
    end
  end

  def name
    if employee_id
      employee.first_name + " " + employee.last_name
    else
      customer.name
    end
  end

  def status
    if locked_at
      { state: "bloqueado", class: "warning" }
    elsif confirmed_at
      { state: "confirmado", class: "primary" }
    else
      { state: "sin confirmar", class: "secondary" }
    end
  end

  def self.search text
    if text && text != ""
      left_joins(:employee)
      .left_joins(customer:  [:person, :organization])
      .where("organizations.name LIKE :param
          OR concat(people.first_name, ' ', people.last_name) like :param 
          OR users.email like :param_id
          OR concat(employees.first_name, ' ', employees.last_name) like :param", { param: "%#{text}%", param_id: "#{text}%" })
    else
      all
    end
  end
end
