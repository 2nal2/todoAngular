class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :dni
      t.text :direction
      t.boolean :status
      t.string :role

      t.timestamps
    end
  end
end
