class AddCashToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :cash, :decimal, default: 0.0, precision: 10, scale: 2
  end
end
