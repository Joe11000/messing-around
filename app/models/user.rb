class User < ApplicationRecord
  has_secure_password
  acts_as_paranoid
  enum sexuality: ['straight', 'bi', 'gay', 'trans']

  validates :authorized, acceptance: { accept: 'yes'}
  validates :email, presence: true, format: { with: /\A.*@.*\.com\z/, message: "only allows letters" }
  validates :sexuality, inclusion: { in: User.sexualities.keys }

  # accepts_nested_attributes_for :dogs, allow_destroy: true
  # validates_associated :dogs
  has_many :dogs, inverse_of: :owner, foreign_key: 'owner_id', class_name: 'Dog'


    # validates :email, uniqueness: true
  validates_uniqueness_of :email, on: :update, message: Proc.new { |user, data| "#{user.sexuality} people must provide a valid #{data[:attribute]}" }

  validates :password, confirmation: true

  # def authorized; end;
  # def authorized= val
  #   val == 'true'
  # end

end
