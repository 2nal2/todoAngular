class ProductPrice < ApplicationRecord
  belongs_to :product

  validates_associated :product
end
