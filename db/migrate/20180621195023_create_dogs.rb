class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.references :owner
      t.timestamps
    end
    add_index :dogs, :name
  end
end
