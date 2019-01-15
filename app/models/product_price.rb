class ProductPrice < ApplicationRecord
  belongs_to :product

  #VALIDACIONES
  validates :price_public, :price_farmacy, :price_distribution, numericality: {greater_than_or_equal_to: 0}
  validates :price_public, :price_farmacy, :price_distribution, presence: true
  validates_associated :product
  validate :overlap
  validate :valid_range
  #END VALIDATIONS

  # custom validators
  def overlap
    if ProductPrice.where("id <> :id AND NOT(end_date <= :start or start_date > :end)", {id: id, start: start_date, end: end_date}).size > 0
      errors.add("fechas", "Ese rango de fecha ya está en uso por otro precio")
    end
  end

  def valid_range
    if start_date > end_date
      errors.add("fechas", "La fecha inicial debe ser menor o igual a la fecha final")
    end
  end
  # end
end
