require 'rails_helper'

RSpec.describe 'User', type: :feature, js: true do
  context 'can' do
    before do
      User.destroy_all
      @user = create(:user)
      login_as(@user)
      visit root_path
      click_link I18n.t('profile.empty')
      sleep 1
      expect(current_path).to eq(new_profile_path(@user))
    end

    it 'upload profile picture' do
      profile = build(:profile)
      fill_in 'name',         with: profile.name
      fill_in 'skype',        with: profile.skype
      fill_in 'twitter',      with: profile.twitter
      fill_in 'github',       with: profile.github
      fill_in 'livecodingtv', with: profile.livecodingtv
      select 'Norway', from: 'profile_born_country'
      select 'Startup', from: 'profile_status'
      attach_file('profile_avatar',
                  Rails.root.join('spec', 'support', 'avatar.png'))
      click_button I18n.t('profile.submit')
      expect(current_path).to eq(profile_path(@user))
      expect(page).to have_css('#profile')
      expect(page).to have_text('Startup')
    end

    it 'update profile picture' do
      profile = build(:profile)
      fill_in 'name',         with: profile.name
      fill_in 'skype',        with: profile.skype
      fill_in 'twitter',      with: profile.twitter
      fill_in 'github',       with: profile.github
      fill_in 'livecodingtv', with: profile.livecodingtv
      select 'Morocco', from: 'profile_born_country'
      select 'Freelancer', from: 'profile_status'
      attach_file('profile_avatar',
                  Rails.root.join('spec', 'support', 'update.jpg'))
      click_button I18n.t('profile.submit')

      click_link 'Your Profile'
      click_link 'Edit'

      profile1 = build(:profile)
      fill_in 'name',         with: profile1.name
      fill_in 'skype',        with: profile1.skype
      fill_in 'twitter',      with: profile1.twitter
      fill_in 'github',       with: profile1.github
      fill_in 'livecodingtv', with: profile1.livecodingtv
      select 'Japan', from: 'profile_born_country'
      select 'Conglomerate', from: 'profile_status'
      attach_file('profile_avatar',
                  Rails.root.join('spec', 'support', 'cat.png'))
      click_button I18n.t('profile.submit')
      expect(current_path).to eq(profile_path(@user))
      expect(page).to have_css('#profile')
    end
  end
end
