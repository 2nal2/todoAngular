class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :name
      t.boolean :status

      t.timestamps
    end
  end
end
