class Dog < ApplicationRecord
  has_many :pictures, as: :imageable

  belongs_to :owner, class_name: :user,
                     presence: true,
                     inverse_of: :dogs
end
