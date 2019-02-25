class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, presence: true, uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_secure_token :activation_code
  after_create :send_admin_mail

  def send_admin_mail
    ActivateAccountMailer.submitted(self).deliver_now
  end

end
