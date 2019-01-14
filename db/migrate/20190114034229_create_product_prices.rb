class CreateProductPrices < ActiveRecord::Migration[5.2]
  def change
    create_table :product_prices do |t|
      t.integer :product_id
      t.float :price_public
      t.float :price_farmacy
      t.float :price_distribution
      t.date :start_date
      t.date :end_date
      t.boolean :status

      t.timestamps
    end
  end
end
