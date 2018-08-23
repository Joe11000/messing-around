class User < ApplicationRecord
  has_one_attached :avatar
#
  self.lock_optimistically = true

  has_secure_password
  acts_as_paranoid

  has_many :pictures, as: :imageable

  before_save :set_created_at_in_timezone

  # has_many :dogs_i_like, foreign_key: 'owner_id', dependent: :restrict_with_error
  has_many :dogs, inverse_of: :owner, foreign_key: 'owner_id', dependent: :restrict_with_error, before_add: :restrict_to_twenty_adoptions
  has_many :recent_adoptions, -> {where('dogs.created_at > ?', 1.hour.ago)}, class_name: 'Dog', foreign_key: 'owner_id'
  accepts_nested_attributes_for :dogs, allow_destroy: true, reject_if: proc {|dog_entry|  dog_entry.blank?}

  scope :old, -> {where('age > 50')}


  # validates_with ::EmailValidator
  enum sexuality: ['straight', 'bi', 'gay', 'trans']
  enum security_clearance: ['user', 'admin']
  # validates :age, :sexuality, desireable: true

  # validates :age, presence: true,
  #                 numericality: {
  #                                 only_integer: true,
  #                                 maximum: 60,
  #                                 greater_than_or_equal_to: 1,
  #                                 message: "number must be larger than 0",
  #                                 too_long: 'You are too old now. Have you thought about moving to Florida?'
  #                               }

  validates :authorized, acceptance: true, on: :create # { accept: 'yes'}

  # validates :email, confirmation: {case_sensative: false}, on: :create
  validates :email, presence: true,
                    format: { with: /\A.*@.*\.com\z/, message: "incorrect format" }

  validates :sexuality, inclusion: { in: User.sexualities.keys }
  validates :email, :age, presence: true

  # validates :email, uniqueness: { scope: :age, case_sensative: false, message: Proc.new { |user, data| "#{user.sexuality} people must provide a valid #{data[:attribute]}" } }

  # def age_confirmation_converter!
  #   age_confirmation = age_confirmation.to_i
  # end
  # validates_associated :dogs


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

  def clock_in
    puts 'Time to babysit some dogs'
  end

  def restrict_to_twenty_adoptions what
    raise if dogs.count >= 20
  end

  def set_created_at_in_timezone(zone='Osaka')
    Time.use_zone(zone) { created_at.to_datetime.change(offset: Time.zone.now.strftime("%z")) }
  end

  def dog_ids_to_associate_with_user _dog_ids
    # remove the dogs the user doesn't want anymore
    dogs.where(id: self.dog_ids - _dog_ids).update_all(owner_id: nil)

    # add the new dogs the user wants
   _dog_ids_to_associate_with_user = _dog_ids - self.dog_ids
    unless _dog_ids_to_associate_with_user.blank?
      self.dogs << Dog.find(_dog_ids_to_associate_with_user)
    end
  end

  def age
    ((Date.today - birthday) / 365).floor.to_i
  end

  def user_not_authorized

  end
end
