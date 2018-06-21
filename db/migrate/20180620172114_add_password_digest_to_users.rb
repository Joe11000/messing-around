class AddPasswordDigestToUsers < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :users, default: Time.now
  end
end
