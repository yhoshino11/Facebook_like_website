require 'rails_helper'

RSpec.describe 'User', type: :feature, js: true do
  context 'can' do
    before do
      @user = create(:user)
      login_as(@user)
      visit root_path
      click_link I18n.t('profile.link')
      click_link I18n.t('profile.avatar.new')
      expect(current_path).to eq(new_profile_path(@user))
    end

    it 'upload profile picture' do
      attach_file('profile_avatar',
                  Rails.root.join('spec', 'support', 'avatar.png'))
      click_button I18n.t('profile.avatar.upload')
    end

    it 'update profile picture' do
      attach_file('profile_avatar',
                  Rails.root.join('spec', 'support', 'avatar.png'))
      click_button I18n.t('profile.avatar.upload')

      visit new_profile_path(@user)

      attach_file('profile_avatar',
                  Rails.root.join('spec', 'support', 'avatar.png'))
      click_button I18n.t('profile.avatar.upload')
    end

    after do
      expect(current_path).to eq(profile_path(@user))
      expect(page).to have_css('#profile')
    end
  end
end
