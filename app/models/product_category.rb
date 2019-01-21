class ProductCategory < ApplicationRecord
  has_many :products

  validates :name, presence: true
  validates :name, length: {minimum: 1, maximum: 255}

  def self.search(text)
    if text && text != ''
      where("name LIKE :param", {param: "%#{text}%"})
    else
      all
    end
  end
end
