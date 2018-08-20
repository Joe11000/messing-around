require 'rails_helper'

RSpec.describe 'The User Sign Up Process', type: :system do
  before(:each) do
    # driven_by :rack_test
    driven_by(:selenium_chrome_headless)

  end

  context 'happy path' do
    context 'a new user can sign up' do
      it 'without dogs' do
        example_password = 'pass'
        joe = FactoryBot.build(:user, password: example_password)

        visit new_user_path
        expect(page.current_path).to eq new_user_path

        within :css, 'form#user-form' do
          fill_in "user[email]", with: joe[:email]
          select joe[:sexuality].titleize, from: 'user[sexuality]'
          fill_in "user[password]", with: example_password
          fill_in "user[password_confirmation]", with: example_password
          check 'authorized?'
          find('#submit').click
        end

        expect(page.current_path).to match /users\/#{User.last.id}/
        expect(page).to have_content joe[:email]
        expect(page).to have_content joe[:sexuality]
      end

      it 'with dogs' do
        example_password = 'pass'
        joe = FactoryBot.build(:user, password: example_password)

        visit new_user_path
        expect(page.current_path).to eq new_user_path

        within :css, 'form#user-form' do
          fill_in "user[email]", with: joe[:email]
          select joe[:sexuality].titleize, from: 'user[sexuality]'
          fill_in "user[password]", with: example_password
          fill_in "user[password_confirmation]", with: example_password
          check 'authorized?'
          find('#submit').click
        end

        expect(page.current_path).to match /users\/#{User.last.id}/
        expect(page).to have_content joe[:email]
        expect(page).to have_content joe[:sexuality]

      end
    end
  end
end
