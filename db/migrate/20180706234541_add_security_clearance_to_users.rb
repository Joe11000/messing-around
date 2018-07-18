class AddSecurityClearanceToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :security_clearance, :integer, default: 0
  end
end
