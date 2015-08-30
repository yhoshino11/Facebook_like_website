require 'rails_helper'

RSpec.describe 'User', type: :feature, js: true do
  context 'can' do
    before do
      User.destroy_all
      @user = create(:user)
      login_as(@user)
      visit root_path
      click_link I18n.t('profile.empty')
      fill_in 'name', with: 'yhoshino11'
      expect(current_path).to eq(new_profile_path(@user))
    end

    it 'upload profile picture' do
      attach_file('profile_avatar',
                  Rails.root.join('spec', 'support', 'avatar.png'))
      click_button I18n.t('profile.submit')
    end

    it 'update profile picture' do
      attach_file('profile_avatar',
                  Rails.root.join('spec', 'support', 'update.jpg'))
      click_button I18n.t('profile.submit')

      click_link 'Your Profile'
      click_link 'Edit'

      attach_file('profile_avatar',
                  Rails.root.join('spec', 'support', 'cat.png'))
      click_button I18n.t('profile.submit')
    end

    after do
      expect(current_path).to eq(profile_path(@user))
      expect(page).to have_css('#profile')
    end
  end
end
