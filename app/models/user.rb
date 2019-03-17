class User < ApplicationRecord
  belongs_to :employee, optional: true
  belongs_to :customer, optional: true

  validates_associated :employee
  validates_associated  :customer

  validates :email, presence: true, uniqueness: true
  validates :employee_id, uniqueness: true, allow_nil: true
  validates :customer_id, uniqueness: true, allow_nil: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         # :trackable,
         :validatable

  has_secure_token :activation_code
  # after_create :send_admin_mail

  def send_admin_mail
    ActivateAccountMailer.submitted(self).deliver_now if type_user == 'C'
  end
end
