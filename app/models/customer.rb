class Customer < ApplicationRecord
  has_one :person
  has_one :organization
  belongs_to :user, optional: true
  belongs_to :province
  accepts_nested_attributes_for :person, :organization

  validates :discount, presence: true
  validates :discount, numericality: {minimum: 0, maximum: 100}
  validates :type_customer, presence: true
  validates :type_customer, inclusion: ["N", "J"]
  validates :comments, length: {maximum: 500}
  validates :direction, length: {maximum: 500}
  validates :email, length: {maximum: 255}
  validates :interest_rate, numericality: {minimum: 0, maximum: 100}
  validates :phone, length: {minimum: 0, maximum: 255}
  validates :province_id, presence: true
  validates :credit_limit, numericality: {minimum: 0}
  validates :credit_time_limit, numericality: {minimum: 0, maximum: 12}
  validates_associated :province
  validates_associated :user
end
