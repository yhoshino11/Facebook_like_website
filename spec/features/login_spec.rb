require 'rails_helper'

RSpec.describe 'Login', type: :feature, js: false do
  context 'User' do
    before { @user = create(:user) }

    it 'with email & password & password confirmation' do
      visit new_user_session_path
      fill_in 'Email',    with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      expect(current_path).to eq(profile_path(@user))
    end
  end
end
