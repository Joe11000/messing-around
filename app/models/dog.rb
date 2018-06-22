class Dog < ApplicationRecord
  belongs_to :owner, class_name: :user, inverse_of: :dogs
end
