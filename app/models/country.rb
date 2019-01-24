class Country < ApplicationRecord
  has_many :provinces

  validates :name, presence: true
  validates :name, length: {minimum: 1, maximum: 255 }
end
