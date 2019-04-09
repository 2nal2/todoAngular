class Customer < ApplicationRecord
  has_one :person
  has_one :organization
  has_one :user
  belongs_to :province
  accepts_nested_attributes_for :person
  accepts_nested_attributes_for :organization

  validates :discount, presence: true
  validates :discount, numericality: { minimum: 0, maximum: 100 }
  validates :type_customer, presence: true
  validates :type_customer, inclusion: ["n", "j"]
  validates :preferential_price, inclusion: ["p", "d", "f"]
  validates :comments, length: { maximum: 500 }
  validates :direction, length: { maximum: 500 }
  validates :email, length: { maximum: 255 }
  validates :interest_rate, numericality: { minimum: 0, maximum: 100 }
  validates :phone, length: { minimum: 0, maximum: 255 }
  validates :province_id, presence: true
  validates :credit_limit, numericality: { minimum: 0 }
  validates :credit_time_limit, numericality: { minimum: 0, maximum: 12 }
  validates_associated :province

  def name
    if type_customer == "n"
      person.first_name + " " + person.last_name
    else
      organization.name
    end
  end

  def self.search(text)
    if text && text != ""
      left_joins(:organization, :person)
        .where("organizations.name LIKE :param
                  OR concat(people.first_name, ' ', people.last_name) like :param
                  OR organizations.ruc like :param_id
                  OR people.dni like :param_id", { param: "%#{text}%", param_id: "#{text}%" })
    else
      all
    end
  end

  def preferential_price_display
    {
      "p" => "público",
      "d" => "distribuidor",
      "f" => "farmacia",
    }[preferential_price]
  end
end
