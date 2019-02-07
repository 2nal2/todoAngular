class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.integer :province_id
      t.string :phone
      t.string :email
      t.string :preferential_price, default: "p"
      t.float :discount
      t.boolean :exonerate_iva, default: false
      t.boolean :exonerate_1, default: false
      t.boolean :exonerate_2, default: false
      t.float :credit_limit, default: 0
      t.integer :credit_time_limit, default: 0
      t.float :interest_rate
      t.text :direction
      t.text :comments
      t.boolean :status
      t.integer :user_id
      t.text :type_customer

      t.timestamps
    end
  end
end
