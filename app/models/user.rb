class User < ApplicationRecord
  has_secure_password
  acts_as_paranoid

  enum sexuality: ['straight', 'bi', 'gay', 'trans']

  validates :email, presence: true, format: { with: /\A.*@.*\.com\z/,
    message: "only allows letters" }
    # validates :email, uniqueness: true
  validates_uniqueness_of :email, on: :update, message: Proc.new { |user, data| "#{user.sexuality} people must provide a valid #{data[:attribute]}" }

  validates :password, confirmation: true

  def authorized; end;
  def authorized= val
    val == 'true'
  end

end
