class ProductCategory < ApplicationRecord
  has_many :products

  def self.search(text)
    if text && text != ''
      where("name LIKE :param", {param: "%#{text}%"})
    else
      all
    end
  end
end
