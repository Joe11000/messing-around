class AddKeywordsSizeToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :keywords, :string
    add_column :products, :size, :string
  end
end
