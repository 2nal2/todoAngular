class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :ruc
      t.string :representant_name
      t.string :representan_phone
      t.string :backup_name
      t.string :backup_phone
      t.integer :customer_id

      t.timestamps
    end
  end
end
