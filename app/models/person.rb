class Person < ApplicationRecord
  belongs_to :customer

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :dni, length: {maximum: 255}
end
