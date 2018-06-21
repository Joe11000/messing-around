class RemoveKeywordsFromProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :keywords, :string
  end
end
