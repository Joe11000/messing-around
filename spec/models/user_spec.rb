require 'rails_helper'

RSpec.describe User, type: :model do

  context 'factory' do
    it 'is valid' do
      expect(FactoryBot.build :user).to be_valid
    end
  end

  context 'class' do
  end

  context 'instance' do
    it { is_expected.to act_as_paranoid }
    it { is_expected.to have_secure_password }

    context 'attribute validations' do
      context '#authorized' do
        it {is_expected.to validate_acceptance_of(:authorized).on(:create)}
      end
      context '#birthday'
      context '#counter_cache'

      context '#cash' do
        it {is_expected.to allow_value(99_999_999.99).for(:cash)}
        it {is_expected.not_to allow_value(100_000_000.00).for(:cash)}
      end

      context '#created_at'
      context '#deleted_at'
      context '#dogs_count' do
        fit 'has the correct amount of dogs associated' do
          user = FactoryBot.create :user

          expect{user.dogs.create (FactoryBot.create :dog) }.to change {user.dogs_count}.from(0).to(1)
        end

      end

      context '#email' do
        it {is_expected.to validate_presence_of(:email)}
        it {is_expected.to validate_uniqueness_of(:email)}
      end

      context '#password' do
        it {is_expected.to validate_confirmation_of(:password)} #.with_message('Please re-enter your password')}
      end

      it '#lock_version -- (locks optimistically)' do
        user = FactoryBot.create :user
        expect{user.update(name: user.name + 'z')}.to change{user.lock_version}.by(1)
      end

      context '#sexuality' do
        it { is_expected.to define_enum_for(:sexuality).with_values(%w(straight bi gay trans)) }
      end

      context '#security_clearance'
      context '#updated_at'
    end

    context 'associations' do
      it {is_expected.to accept_nested_attributes_for(:dogs).allow_destroy(true)}
    end

    context 'scopes' do
      context '.old'
    end

    context '#send_welcome_email' do
      it 'enqueues a welcome email' do
        user = FactoryBot.build :user

        expect{ user.send_welcome_email }.to change { ActionMailer::Base.deliveries }.by(1)
      end
    end
  end




  # it {is_expected.to validate_uniqueness_of(:email).with_message}

  # it {is_expected.to validate_confirmation_of(:password)}


end
