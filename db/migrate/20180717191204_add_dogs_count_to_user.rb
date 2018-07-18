class AddDogsCountToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :dogs_count, :integer
  end
end
