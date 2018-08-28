require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has correct macros'
    it 'has correct associations'
  # it {is_expected.to have_secure_password }
  # it {is_expected.to validate_uniqueness_of(:email).with_message}

  # it {is_expected.to validate_confirmation_of(:password)}

  it 'has a valid factory'


  context '#send_welcome_email' do
    it 'enqueues a welcome email' do
      user = FactoryBot.build :user

      expect{ user.send_welcome_email }.to change { ActionMailer::Base.deliveries }.by(1)
    end
  end
end
