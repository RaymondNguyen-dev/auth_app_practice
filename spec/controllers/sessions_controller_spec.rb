require 'rails_helper'

RSpec.describe 'Authentication', type: :feature do
  describe 'User sign in' do
    let(:user) { create(:user, password: "password123", password_confirmation: "password123") }

    it 'signs user in and redirects to root path' do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'password123'
      click_button 'Log in'

      expect(page).to have_content('Signed in successfully.')
      expect(current_path).to eq(root_path)
    end

    it 'fails to sign in with incorrect password' do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'wrongpassword'
      click_button 'Log in'

      expect(page).to have_content('Invalid Email or password.')
      expect(current_path).to eq(new_user_session_path)
    end

    it 'fails to sign in with non-existent email' do
      visit new_user_session_path
      fill_in 'Email', with: 'nonexistent@example.com'
      fill_in 'Password', with: 'password123'
      click_button 'Log in'

      expect(page).to have_content('Invalid Email or password.')
      expect(current_path).to eq(new_user_session_path)
    end
  end

  describe 'User sign out' do
    let(:user) { create(:user) }

    before do
      sign_in user
      visit root_path
    end

    it 'signs out user and redirects to root path' do
      click_button 'Logout'
      expect(page).to have_content('Signed out successfully.')
    end
  end

  describe 'User sign up' do
    it 'successfully signs up a new user' do
      visit new_user_registration_path
      fill_in 'Email', with: 'newuser@example.com'
      fill_in 'Password', with: 'password123'
      fill_in 'Password confirmation', with: 'password123'
      click_button 'Sign up'

      expect(page).to have_content('Welcome! You have signed up successfully.')
      expect(current_path).to eq(root_path)
    end

    it 'fails to sign up with mismatched password confirmation' do
      visit new_user_registration_path
      fill_in 'Email', with: 'newuser@example.com'
      fill_in 'Password', with: 'password123'
      fill_in 'Password confirmation', with: 'wrongpassword'
      click_button 'Sign up'

      expect(page).to have_content("Password confirmation doesn't match Password")
      expect(current_path).to eq(user_registration_path)
    end

    it 'fails to sign up with an already taken email' do
      existing_user = create(:user, email: 'existinguser@example.com')
      visit new_user_registration_path
      fill_in 'Email', with: existing_user.email
      fill_in 'Password', with: 'password123'
      fill_in 'Password confirmation', with: 'password123'
      click_button 'Sign up'

      expect(page).to have_content('Email has already been taken')
      expect(current_path).to eq(user_registration_path)
    end
  end
end
