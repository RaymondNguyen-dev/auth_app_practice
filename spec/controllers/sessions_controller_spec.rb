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
end
