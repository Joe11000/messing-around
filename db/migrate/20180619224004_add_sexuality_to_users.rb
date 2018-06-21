class AddSexualityToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sexuality, :integer, default: 0
  end
end
