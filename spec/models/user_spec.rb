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
    xit { is_expected.to have_secure_password }

    context 'attribute validations' do
      xcontext '#authorized' do
        it {is_expected.to validate_acceptance_of(:authorized).on(:create)}
      end
      context '#birthday'
      context '#counter_cache'

      xcontext '#cash' do
        it {is_expected.to allow_value(99_999_999.99).for(:cash)}
        it {is_expected.not_to allow_value(100_000_000.00).for(:cash)}
      end

      context '#created_at'
      context '#deleted_at'

      context '#dogs_count' do
        it 'has the correct amount of dogs associated' do
          user = FactoryBot.create :user

          expect{user.dogs << FactoryBot.create(:dog); user.reload }.to change {user.dogs_count}.from(nil).to(1)
        end

      end

      xcontext '#email' do
        it {is_expected.to validate_presence_of(:email)}
        it {is_expected.to validate_uniqueness_of(:email)}
      end

      xcontext '#password' do
        it {is_expected.to validate_confirmation_of(:password).on(:create)} #.with_message('Please re-enter your password')}
      end

      it '#lock_version -- (locks optimistically)' do
        user = FactoryBot.create :user
        expect{user.update(name: user.name + 'z')}.to change{user.lock_version}.by(1)
      end

      xcontext '#sexuality' do
        it { is_expected.to define_enum_for(:sexuality).with_values(%w(straight bi gay trans)).backed_by_column_of_type(:integer) }
      end

      xcontext '#security_clearance' do
        it {is_expected.to define_enum_for(:security_clearance).with_values(%w(user admin)).backed_by_column_of_type(:integer)}
      end

      context '#updated_at'
    end

    context 'methods' do
      context '#send_welcome_email' do
        it 'enqueues a welcome email' do
          user = FactoryBot.create :user

          # ActionMailer::Base.deliveries = []
          # ActionMailer::Base.delivery_method = :test

          # ActionMailer::Base.perform_deliveries = true
          expect{ user.send_welcome_email }.to change { ActionMailer::Base.deliveries.length }.by(1)
        end

        it '#clock_in'
        it '#restrict_to_twenty_adoptions'
        it '#set_created_at_in_timezone'
        it '#dog_ids_to_associate_with_user'
        it '#age'
        it '#send_welcome_email'
      end

    end

    xcontext 'associations' do
      it { is_expected.to accept_nested_attributes_for(:dogs).allow_destroy(true) }
      it { is_expected.to have_many(:dogs).foreign_key(:owner_id) }

      context 'active_storage' do
        it { is_expected.to have_many(:pictures) }
        it { is_expected.to have_one(:avatar) }
      end

      context '#recent_adoptions' do
        it { is_expected.to have_many(:recent_adoptions).conditions('birthday > ?', 50.years.ago ).order(name: :asc) }
      end

    end

    # context 'scopes' do
      # context '.old' do
        # it 'only shows users under age 50' do

        #   # expect
        # end
      # end
    # end

  end




  # it {is_expected.to validate_uniqueness_of(:email).with_message}

  # it {is_expected.to validate_confirmation_of(:password)}


end
