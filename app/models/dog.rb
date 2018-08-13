class Dog < ApplicationRecord
  has_one_attached :avatar
  acts_as_paranoid
  has_many :pictures, as: :imageable

  scope :puppies, ->{ where('age < 4') }
  scope :adopted, -> { where('owner_id > 0') }
  scope :not_adopted, -> { where('owner_id IS NULL') }

  belongs_to :owner, #-> { where 'users.sexuality = 1' },
                     class_name: 'User',
                     foreign_key: 'owner_id',
                     inverse_of: :dogs,
                     optional: true,
                     counter_cache: true
                     # presence: true,

  has_many :toys, inverse_of: :dog
end


# User.create(age: 29, password: 'pass',  email: 'joe@gmail.com', birthday: Date.today, dogs_attributes: {age: 12, name: 'Rex'})
