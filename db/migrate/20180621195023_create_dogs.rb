class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.references :user
      t.string :name
      t.integer :age

      t.timestamps
    end
    add_index :dogs, :name
    # add_reference :owner, :user
  end
end
