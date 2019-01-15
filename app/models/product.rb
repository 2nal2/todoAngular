class Product < ApplicationRecord
  belongs_to :product_category
  has_one_attached :image
  has_many :product_prices
  belongs_to :measure_type, class_name: 'Measure', foreign_key: 'measure_id'


  #validations
  validates_associated :product_category
  validates_associated :measure_type
  validates :stock, numericality: {greater_than_or_equal_to: 0}
  validates :min_stock, numericality: {greater_than_or_equal_to: 0}
  validates :cost, numericality: {greater_than_or_equal_to: 0}
  validates :measure, numericality: {greater_than_or_equal_to: 0}
  validates :name, length: { minimum: 1, maximum: 255 }
  validates :description, length: { minimum: 1, maximum: 500 }
  validates :name, presence: true
  validates :cost, presence: true
  validates :stock, presence: true
  validates :min_stock, presence: true
  validates :measure, presence: true
  validates :description, presence: true
  # validates :has_iva, presence: true
  # validates :need_prescription, presence: true
  validates :bar_code, numericality: {only_integer: true}
  # end validations

  def prices
    prices_list = self.product_prices.where("start_date <= :now AND end_date >= :now",
                                            {now: Time.now.to_date}).order(end_date: :desc);

    prices_list.size > 0 ? prices_list[0] : nil
  end

  def self.search(text)
    if text && text != ''
      where("name LIKE :param OR bar_code = :param_code", {param: "%#{text}%", param_code: text})
    else
      all
    end
  end

end
