require 'rails_helper'

RSpec.describe Dog, type: :model do

  context 'factory'do
    it 'is valid' do
      expect(FactoryBot.build(:dog)).to be_valid
    end
  end

  context '.adopted' do

    it 'returns adopted dogs' do
      adopted = FactoryBot.create :dog
      not_adopted = FactoryBot.create :dog, owner: nil
      expect(Dog.adopted.to_a).to match_array [adopted]
    end

    it 'returns dogs not adopted yet' do
      adopted = FactoryBot.create :dog
      not_adopted = FactoryBot.create :dog, owner: nil
      expect(Dog.not_adopted.to_a).to match_array [not_adopted]
    end
  end

  context ''

  # scope :unadopted, -> { where(owner: nil) }
  # it {is_expected.to have_secure_password }
  # it {is_expected.to validate_uniqueness_of(:email).with_message}

  # it {is_expected.to validate_confirmation_of(:password)}
end
