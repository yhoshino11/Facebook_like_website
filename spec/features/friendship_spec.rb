require 'rails_helper'

RSpec.describe 'All User', type: :feature, js: false do
  context 'can' do
    before do
      User.destroy_all
      @me       = create(:user)
      @him      = create(:user, email: 'yhoshino12@gmail.com')
      @her      = create(:user, email: 'yhoshino13@gmail.com')
      @me_prof  = @me.create_profile(attributes_for(:profile))
      @him_prof = @him.create_profile(attributes_for(:profile))
      @her_prof = @her.create_profile(attributes_for(:profile))
    end

    it 'hide their name from anonymous users' do
      login_as(@me)
      visit profile_path(@him)
      expect(page).to have_text('Send Friend Request')
    end

    it 'send friend request'
    it 'accept friend request'
    it 'decline friend request'
    it 'remove friend'
    it 'check friendship'
    it 'check requested friends'
    it 'check pending friends'
    it 'check all friends'
  end
end
