json.(user, *User.attribute_names)
json.set! 'dog_owner' do
  # json.extract! user, :name, :age
  json.(user, :name, :age)
end

























































# json.extract! @user, :id, :email,:name, :birthday
# json.(@user, :name, :age, :dogs_count)
# json.member_since user.created_at
# json.last_checked_in  user.updated_at.strftime('%d-%m-%Y')
# json.url user_url(user, format: :json)

# json.array! User.first(3), :id, :name


# columns_i_care_about = [:name, :age, :dogs_count]
# json.return %w(what's love go to do with it)
# json.array! User.where(dogs_count: nil), :name, :age, :dogs_count
# json.array! User.where(dogs_count: nil) do |u|
#   json.(u, :name, :age, :dogs_count)
# end

# json.set! "array!", %w(what's love go to do with it)


# json.set! "#{'lyrics'.upcase}",  "TO"
# json.set! :A,  "sound Of Music"


# json.set! "Do".to_sym do
#   json.set! 'a deer', 'a female deer'
# end



# json.Ray do
#   json.A do
#     json.Drop do
#       json.Of do
#         json.Golden "Sun"
#       end
#     end
#   end
# end

# h = {Me: {A: {Name: {I: {Call: :Myself }}}}}
# json.merge! h

# json.user user, :name, :age, :dogs_count
# json.users User.order(name: :asc, age: :asc).where('dogs_count >= 1') do |u|
#   json.user u, :name, :age, :dogs_count
# end
