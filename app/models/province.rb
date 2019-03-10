class Province < ApplicationRecord
  belongs_to :country

  validates_associated :country
  validates :name, presence: true
  validates :name, length: {minimum: 1, maximum: 255}

  def self.search(text)
    if text && !text.blank?
      where("name ILIKE :param", {param: "%#{text}%"})
    else
      all
    end
  end
end
