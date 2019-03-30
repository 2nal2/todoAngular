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
      employee.role
    else
      'customer'
    end
  end

  def name
    if employee_id
      employee.first_name + " " + employee.last_name
    else
      customer.name
    end
  end
end
