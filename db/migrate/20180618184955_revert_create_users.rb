class RevertCreateUsers < ActiveRecord::Migration[5.2]
  def change
    revert CreateUsers


  end
end
