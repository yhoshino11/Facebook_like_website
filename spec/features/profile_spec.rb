require 'rails_helper'

RSpec.describe 'User', type: :feature, js: true do
  before { User.destroy_all }
  context 'can' do
    before do
      country = ISO3166::Country.all_translated.sample
      User.destroy_all
      @user = create(:user)
      login_as(@user)
      visit root_path
      click_link I18n.t('profile.empty')
      sleep 1
      expect(current_path).to eq(new_profile_path(@user))
      profile = build(:profile)
      fill_in 'name',                     with: profile.name
      select 'Male',                      from: 'profile_sex'
      fill_in 'skype',        with: profile.skype
      fill_in 'twitter',      with: profile.twitter
      fill_in 'github',       with: profile.github
      fill_in 'livecodingtv', with: profile.livecodingtv
      select country,         from: 'profile_born_country'
      select 'Startup',       from: 'profile_status'
      select 'Ruby',          from: 'profile_language_name'
      select 'Python',        from: 'profile_language_name'
      select 'Rust',          from: 'profile_language_name'
      click_button I18n.t('profile.submit')
    end

    it 'create profile' do
      expect(current_path).to eq(profile_path(@user))
      expect(page).to have_css('#profile')
      expect(page).to have_text('Startup')
      expect(page).to have_text('I want to learn')
    end

    it 'update profile' do
      click_link 'Your Profile'
      click_link 'Edit'
      country1 = ISO3166::Country.all_translated.sample

      profile1 = build(:profile)
      fill_in 'name',                     with: profile1.name
      select 'Male',                      from: 'profile_sex'
      fill_in 'skype',        with: profile1.skype
      fill_in 'twitter',      with: profile1.twitter
      fill_in 'github',       with: profile1.github
      fill_in 'livecodingtv', with: profile1.livecodingtv
      select 'Conglomerate',  from: 'profile_status'
      select country1,        from: 'profile_born_country'
      unselect 'Ruby',        from: 'profile_language_name'
      unselect 'Python',      from: 'profile_language_name'
      select 'Rust',          from: 'profile_language_name'
      click_button I18n.t('profile.submit')
      expect(current_path).to eq(profile_path(@user))
      expect(page).to have_css('#profile')
    end
  end
  after { User.destroy_all }
end
