class DropTablePictures < ActiveRecord::Migration[5.2]
  def change
    drop_table :pictures
    drop_table :suppliers
    drop_table :messages
  end
end
