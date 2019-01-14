class Product < ApplicationRecord
  belongs_to :product_category
  has_one_attached :image
  has_many :product_prices
  belongs_to :measure_type, class_name: 'Measure', foreign_key: 'measure_id'

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
