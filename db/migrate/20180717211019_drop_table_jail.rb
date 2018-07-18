class DropTableJail < ActiveRecord::Migration[5.2]
  def up
    execute <<~SQL
      DROP TABLE jails;
      DROP TABLE prisoner;
      DROP TABLE products;
    SQL
  end
end
