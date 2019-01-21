class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.integer :province_id
      t.string :phone
      t.string :email
      t.string :preferential_price
      t.float :discount
      t.boolean :exonerate_iva
      t.boolean :exonerate_1
      t.boolean :exonerate_2
      t.float :credit_limit
      t.integer :credit_time_limit
      t.float :interest_rate
      t.text :direction
      t.text :comments
      t.boolean :status
      t.integer :user_id
      t.integer :type_customer

      t.timestamps
    end
  end
end
