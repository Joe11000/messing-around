class AddDeletedAtToDog < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :deleted_at, :datetime
    add_index :dogs, :deleted_at
  end
end
