class Customer < ApplicationRecord
  has_one :person
  has_one :organization
  belongs_to :user
end
