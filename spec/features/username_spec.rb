require 'rails_helper'

RSpec.describe 'Username', type: :feature, js: true do
  context 'is needed for each user' do
    before do
      User.destroy_all
      @user = create(:user)
      login_as(@user)
      visit root_path
    end

    it 'for profile' do
      click_link I18n.t('profile.empty')
      fill_in 'profile_name', with: 'yhoshino11'
      attach_file('profile_avatar',
                  Rails.root.join('spec', 'support', 'avatar.png'))
      click_button I18n.t('profile.submit')
      expect(current_path).to eq(profile_path(@user))

      click_link I18n.t('profile.edit')
      sleep 1
      expect(current_path).to eq(edit_profile_path(@user))

      fill_in 'name', with: 'yhoshino11'
      click_button I18n.t('profile.submit')

      expect(current_path).to eq(profile_path(@user))
      expect(page).to have_text('yhoshino11')
    end
  end
end
