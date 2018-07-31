require 'rails_helper'

RSpec.describe 'adoption process' do
  context 'a user can adopt one dog' do
    visit adopt_dogs_path

  end

  context 'a user can adopt multiple dogs' do
  end
end
