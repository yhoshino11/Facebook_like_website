require 'rails_helper'

RSpec.describe 'Avatar', type: :feature, js: false do
  context 'is needed' do
    before do
      @user = create(:user)
      login_as(@user)
      visit profile_path(@user)
    end

    it 'for each User' do
      expect(page).to have_link(I18n.t('profile.avatar.new'))
    end

    it "to be uploaded by user's profile page" do
      click_link I18n.t('profile.avatar.new')
      expect(current_path).to eq(new_profile_path(@user))
    end
  end
end
