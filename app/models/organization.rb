class Organization < ApplicationRecord
  belongs_to :customer

  validates :name, presence: true
  validates :ruc, presence: true
  validates :name, length: {minimum: 1, maximum: 255}
  validates :ruc, length: {minimum: 1, maximum: 255}
  validates :representant_name, presence: true
  validates :representant_phone, presence: true
  validates :representant_name, length: {minimum: 1, maximum: 255}
  validates :representant_phone, length: {minimum: 1, maximum: 255}
  # validates_associated :customer
end
