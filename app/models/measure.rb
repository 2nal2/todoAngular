class Measure < ApplicationRecord
  has_many :products

  validates :code, uniqueness: true
  validates :name, uniqueness: true
  validates :code, presence: true
  validates :name, presence: true
  validates :code, length: {minimum: 1, maximum: 255}
  validates :name, length: {minimum: 1, maximum: 255}
end
