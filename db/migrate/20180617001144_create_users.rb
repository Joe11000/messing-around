# class CreateUsers < ActiveRecord::Migration[5.2]
#   def change
#     create_table :users do |t|
#       t.string :name, default: 'John Doe', null: false
#       t.string :email, limit: 30, index: true, null: false
#       t.datetime :birthday, null: false
#       t.string :password, null: false
#       t.timestamps
#     end

#     change_table :users do |t|
#       t.decimal :money, precision: 8
#     end

#     change_column_null :users, :money, :false
#     change_column_default :users, :money, from: 0, to: 1000.00
#   end
# end


class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, default: 'John Doe', null: false, limit: 35
      t.string :email, null: false, default: 'a@aol.com', limit: 35
      t.decimal :money, null: false, default: 0, precision: 10, scale: 2
      t.date :birthday, null: false, default: Date.today, comment: 'Please do not lie'
      t.string :fuckity
      t.timestamps
    end

    change_table :users do |t|
      t.rename :fuckity, :fuckity_2
      # t.string :fuckity_2, null: false
    end

    say_with_time "Removing useless column" do
      sleep 0.2
      15
    end

    suppress_messages do
      remove_column :users, :fuckity_2, :string
    end

  end

end

















































# class CreateUser < ActiveRecord::Migration[5,2]
#   def change
#     create_table :users do |t|
#       t.string :name, null: false, length: 25
#       t.double :money, null: false, default: 0.0, precision: 10, scope: 2
#       t.string :email, null: false
#       t.string :password_digest
#       t.string :remove_me
#     end

#     change_table :users do |t|
#       t.rename :remove_me, :remove_me_2
#       t.integer :remove_me_2
#     end
#   end
# end
