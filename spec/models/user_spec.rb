require 'rails_helper'

RSpec.describe User, type: :model do

  it 'has a valid factory' do
    expect(FactoryBot.build :user).to be_valid
  end

  it { is_expected.to act_as_paranoid }
  it { is_expected.to have_secure_password }

  context 'attribute validations' do
    context 'cash' do
      it {is_expected.to allow_value(99_999_999.99).for(:cash)}
      it {is_expected.not_to allow_value(100_000_000.00).for(:cash)}
    end
    it {is_expected.to validate_acceptance_of(:authorized).on(:create)}

    it {is_expected.to validate_confirmation_of(:password)} #.with_message('Please re-enter your password')}
    it {is_expected.to validate_presence_of(:email)}
  end

  fit 'locks optimistically' do
    user = FactoryBot.create :user
    expect{user.update(name: user.name + 'z')}.to change{user.version}.by(1)
  end

  context 'has correct associations' do
    it {is_expected.to accept_nested_attributes_for(:dogs).allow_destroy(true)}

  end
  # it {is_expected.to validate_uniqueness_of(:email).with_message}

  # it {is_expected.to validate_confirmation_of(:password)}



  context '#send_welcome_email' do
    it 'enqueues a welcome email' do
      user = FactoryBot.build :user

      expect{ user.send_welcome_email }.to change { ActionMailer::Base.deliveries }.by(1)
    end
  end



end
