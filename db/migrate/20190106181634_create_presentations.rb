class CreatePresentations < ActiveRecord::Migration[5.2]
  def change
    create_table :presentations do |t|
      t.integer :measure_id
      t.integer :name

      t.timestamps
    end
  end
end
