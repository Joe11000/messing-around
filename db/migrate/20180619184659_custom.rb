class Custom < ActiveRecord::Migration[5.2]
  def up
    say 'add anonymous names to all'


      execute <<~SQL

        UPDATE users
        SET email = 'a@aol.com'
        WHERE email = Null;
      SQL
  end


end
