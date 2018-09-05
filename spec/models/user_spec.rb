require 'rails_helper'

RSpec.describe User, type: :model do

  context 'factory' do
    it 'is valid' do
      expect(FactoryBot.build :user).to be_valid
    end
  end

  context 'migration' do
    t.date "birthday", null: false
    it {is_expected.to(have_db_column(:birthday) \
                       .of_type(:date)
                       .with_options(null: false))}

    t.decimal "cash", precision: 10, scale: 2, default: "0.0"
    it {is_expected.to have_db_column(:cash).of_type(:decimal).with_options(precision: 10, scale: 2, default: '0.0')}

    t.integer "counter_cache"
    it {is_expected.to have_db_column(:counter_cache).of_type(:integer).with_options(default: "2018-08-28 21:44:32", null: false)}






    it {is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false)}
    t.datetime "created_at", default: "2018-08-28 21:44:32", null: false

    t.datetime "deleted_at"
    t.integer "dogs_count"
    t.string "email"
    t.integer "lock_version"
    t.string "name"
    t.string "password_digest"
    t.integer "sexuality", default: 0
    t.integer "security_clearance", default: 0
    t.datetime "updated_at", default: "2018-08-28 21:44:32", null: false

    it { is_expected.to have_db_index(:deleted_at) }
    t.index ["deleted_at"], name: "index_users_on_deleted_at"

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


  # it { is_expected.to define_enum_for(:sexuality).with_values(%w(straight bi gay trans)).backed_by_column_of_type(:integer).with_prefix(:society_says).with_suffix(:but_still_fabulous) }

  # it { belongs_to(:xmen).autosave(true) \
  #                       .class_name(:) \
  #                       .conditions(powers: true) \
  #                       .dependent(:) \
  #                       .inverse_of(:mutants) \
  #                       .optional \
  #                       .order(level: :desc) \
  #                       .required \
  #                       .with_primary_key(:) \
  #                       .with_foreign_key(:) \
  #                       .touch(true) }

  # it { accepts_nested_attributes_for(:dogs).allow_destroy(true) \
  #                                          .limit(4) \
  #                                          .update_only(false) }


  # it { is_expected.to define_enum_for(:sexuality).backed_by_column_of_type(:integer) \
  #                            .with_prefix(:prefix) \
  #                            .with_suffix(:suffix) \
  #                            .with_values(%w(straight bi gay trans))}

end
