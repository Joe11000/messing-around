class AddDeletedAtToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :deleted_at, :datetime
    add_index :users, :deleted_at

    add_column :users, :password_digest, :string
  end
end
