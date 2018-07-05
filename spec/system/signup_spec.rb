require 'rails_helper'

RSpec.describe 'The User Sign Up Process', type: :system do
  before(:each) do
    driven_by :rack_test
  end


  context 'happy path' do
    it 'A new user can fill out the sign up form' do
      joe = { email: 'joe@gmail.com', age: 29, sexuality: 'straight', password: 'pass'}
      visit new_user_path
      expect(page.current_path).to eq new_user_path

      within 'form#user-form' do
        fill_in "user[email]", with: joe[:email]
        select joe[:sexuality].titleize, from: "user[sexuality]"
        fill_in "user[age]", with: joe[:age]
        fill_in "user[password]", with: joe[:password]
        fill_in "user[password_confirmation]", with: joe[:password]
        check 'authorized?'
        click_button 'Create User'
      end

      byebug
      expect(page.current_path).to match /users\/\d+/
      expect(page).to have_content('joe@gmail.com')
    end
  end
end
