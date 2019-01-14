class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :product_category_id
      t.string :name
      t.string :bar_code
      t.boolean :has_iva
      t.boolean :need_prescription
      t.integer :stock
      t.integer :min_stock
      t.float :cost
      t.float :measure
      t.integer :measure_id
      t.text :description
      t.boolean :status

      t.timestamps
    end
  end
end
