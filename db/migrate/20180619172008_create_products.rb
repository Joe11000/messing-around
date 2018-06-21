class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do
    end

    create_table :products do |t|
      t.string :name
      t.string :sku, limit: 10
      t.integer :count
      t.text :description
      t.references :supplier, foreign_key: true
      t.float :popularity
      t.decimal :price, precision: 10, scale: 2
      t.boolean :available
      t.datetime :availableSince
      t.binary :image

      t.timestamps
    end
    add_index :products, :name
    add_index :products, :sku, unique: true
  end
end
