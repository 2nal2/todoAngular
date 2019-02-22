class AddIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :customers, foreign_key: true
    add_reference :users, :employees, foreign_key: true
  end
end
