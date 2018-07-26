json.users @users, partial: 'users/user', as: :user, spacer_template: 'dogs/dog'

# json.set! :author do
#   json.set! name: 'David'
# end

# json.authors @users do |user|
#   json.(user, :name, :age, :email)
# end

# json.authors @users, :name, :age, :dogs_count

# u = 1
# json.examles do
#   # json.array! %w(one two three four),
#   json.users @users do |user|
#     # json.nil!
#     json.(user, :name, :email)
#     json.dogs user.dogs do |dog|
#       json.extract!(dog, *Dog.attribute_names)
#     end
#   end
# end


