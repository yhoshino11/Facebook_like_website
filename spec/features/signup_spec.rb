require 'rails_helper'

RSpec.describe 'Signup', type: :feature, js: true do
  context 'User' do
    let(:user) { build(:user) }

    scenario 'with email & password & password confirmation' do
      visit new_user_registration_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password
      click_button 'Sign up'
      expect(page).to have_text('Home')
    end
  end
end
