class FuckinAround < ActiveRecord::Migration[5.2]
  def change

    say_with_time 'Creating Tables' do
      create_table :users do |t|
        t.string :email

        t.timestamps
      end
    end

    say 'Editing Users Table'

    suppress_messages do
      change_column_default :users, :email, from: nil, to: 'a@aol.com'
      add_index :users, :email
      remove_index :users, :email
      rename_table :users, :pois
      remove_timestamps :pois

      change_table :pois do |t|
        t.remove :email
        t.string :email
      end

      rename_table :pois, :users
    end

    create_table :jails do |t|
      t.string :name
    end

    create_join_table :users, :jails, table_name: :prisoner, column_options: {null: false} do |t|
      t.integer :time
      t.integer :number, max: 15
    end


    add_column :users, :age, :integer
    change_column :users, :age, :string
  end
end

