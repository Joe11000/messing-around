class User < ApplicationRecord
  has_many :pictures, as: :imageable

  # validates_with ::EmailValidator
  has_secure_password
  acts_as_paranoid
  enum sexuality: ['straight', 'bi', 'gay', 'trans']
  # validates :age, :sexuality, desireable: true
  validates :age, presence: true,
                  numericality: {
                                  only_integer: true,
                                  maximum: 60,
                                  greater_than_or_equal_to: 1,
                                  message: "number must be larger than 0",
                                  too_long: 'You are too old now. Time to die.'
                                }

  validates :authorized, acceptance: true# { accept: 'yes'}

  validates :email, confirmation: {case_sensative: false}, on: :create
  validates :email, presence: true,
                    format: { with: /\A.*@.*\.com\z/, message: "only allows letters" }

  validates :sexuality, inclusion: { in: User.sexualities.keys }
  validates :email, :age, presence: true

  validates :email, uniqueness: { scope: :age, case_sensative: false, message: Proc.new { |user, data| "#{user.sexuality} people must provide a valid #{data[:attribute]}" } }

  # def age_confirmation_converter!
  #   age_confirmation = age_confirmation.to_i
  # end
  # accepts_nested_attributes_for :dogs, allow_destroy: true
  # validates_associated :dogs
  has_many :dogs, inverse_of: :owner, foreign_key: 'owner_id', class_name: 'Dog'


    # validates :email, uniqueness: true
  validates :password, confirmation: true

  # validates :email, exclusion: {in: ['fu@aol.com'], message: 'dude, come on'}
  # validates :email, format: {with: /$what\?^/, message: 'this pattern works'}
  # validates :email, inclusion: {in: ['must have this']}
  # validates :email, length: {is: 5}
  # validates :email, length: {minimum: 5}
  # validates :email, length: {maximum: 5}
  # validates :email, length: { in: 5..5 }
  # validates :email, numericality: {only_integer: true}
end


