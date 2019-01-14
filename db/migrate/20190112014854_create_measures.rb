class CreateMeasures < ActiveRecord::Migration[5.2]
  def change
    create_table :measures do |t|
      t.string :name
      t.string :code
      t.boolean :status

      t.timestamps
    end
  end
end
