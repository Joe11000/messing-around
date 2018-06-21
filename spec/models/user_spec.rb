require 'rails_helper'

RSpec.describe User, type: :model do
  it {is_expected.to have_secure_password }
  it {is_expected.to validate_uniqueness_of(:email).with_message}

  it {is_expected.to validate_confirmation_of(:password)}
end
