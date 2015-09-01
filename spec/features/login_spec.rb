require 'rails_helper'

RSpec.describe 'Login', type: :feature, js: false do
  before { User.destroy_all }
  context 'User' do
    before do
      User.destroy_all
      create(:user)
    end

    let(:user) { build(:user) }

    scenario 'with email & password & password confirmation' do
      visit new_user_session_path
      fill_in 'Email',    with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      expect(page).to have_link(I18n.t('profile.empty'))
    end
  end
  after { User.destroy_all }
end
