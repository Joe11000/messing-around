class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.string :title
      t.references :imageable, polymorphic: true, index: true
    end
  end
end
