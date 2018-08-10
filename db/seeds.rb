# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 3.times { User.create }

FactoryBot.create_list(:dog, 25) do |dog|
  dog.toys.create(FactoryBot.attributes_for_list(:squeeky_toy, 2) )
  dog.toys.create(FactoryBot.attributes_for_list(:fetch_toy, 2) )
end

# create some unadopted dogs
FactoryBot.create_list(:dog, 5, owner: nil)

FactoryBot.create_list :user, 10, :dog_sitter
