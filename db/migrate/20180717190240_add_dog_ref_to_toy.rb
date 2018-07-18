class AddDogRefToToy < ActiveRecord::Migration[5.2]
  def change
    add_reference :toys, :dog, foreign_key: true
  end
end
