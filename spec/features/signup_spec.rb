require 'rails_helper'

RSpec.describe 'Signup', type: :feature, js: true do
  context 'User' do
    before { User.destroy_all }
    let(:user) { build(:user) }

    scenario 'with email & password & password confirmation' do
      visit root_path
      click_link 'Sign up'
      fill_in 'Email',                 with: user.email
      fill_in 'Password',              with: user.password
      fill_in 'Password confirmation', with: user.password
      click_button 'Sign up'
      expect(page).to have_link(I18n.t('profile.empty'))
    end
  end
end
