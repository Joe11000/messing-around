class AddCounterCacheToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :counter_cache, :integer
  end
end
