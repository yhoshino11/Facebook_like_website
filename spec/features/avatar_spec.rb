require 'rails_helper'

RSpec.describe 'Avatar', type: :feature, js: true do
  context 'is needed' do
    it 'for each User' do
      @user = create(:user)
      login_as(@user)
      visit profile_path(@user)
      expect(page).to have_link(I18n.t('profile.avatar.new'))
    end

    it 'to be uploaded by user\'s profile page' do
      @user = create(:user)
      login_as(@user)
      visit profile_path(@user)
      click_link I18n.t('profile.avatar.new')
      expect(current_path).to eq(new_profile_path(@user))
    end

    after(:each) { User.destroy_all }
  end
end
