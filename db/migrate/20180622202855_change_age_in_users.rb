class ChangeAgeInUsers < ActiveRecord::Migration[5.2]
  def change
    say 'converting user.age from string -> integer'

    suppress_messages do
      add_column :users, :new_age, :integer

      User.all.each do |user|
        user.update(new_age: user.age)
      end

      remove_column :users, :age, :integer
      rename_column :users, :new_age, :age
    end
  end
end
