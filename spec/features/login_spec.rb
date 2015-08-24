require 'rails_helper'

RSpec.describe 'Login', type: :feature, js: true do
  context 'User' do
    before do
      create(:user)
    end

    let(:user) { build(:user) }

    scenario 'with email & password & password confirmation' do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      expect(page).to have_text('Home')
    end
  end
end