class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :product_category_id
      t.string :bar_code
      t.string :name
      t.boolean :has_iva
      t.text :description
      t.boolean :need_prescription
      t.integer :min_stock
      t.integer :stock
      t.float :cost

      t.timestamps
    end
  end
end
