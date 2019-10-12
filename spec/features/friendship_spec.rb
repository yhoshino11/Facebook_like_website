require 'rails_helper'

RSpec.describe 'All User', type: :feature, js: true do

  context 'can' do
    before(:each) do
      User.destroy_all
      @me       = create(:user, email: 'yhoshino11@gmail.com')
      @him      = create(:user, email: 'yhoshino12@gmail.com')
      @her      = create(:user, email: 'yhoshino13@gmail.com')
      @me_prof  = @me.create_profile(attributes_for(:profile))
      @him_prof = @him.create_profile(attributes_for(:profile))
      @her_prof = @her.create_profile(attributes_for(:profile))
    end

    it "hide their 'Status' from anonymous users" do
      login_as(@me)
      visit profile_path(@him)
      expect(page).not_to have_text('Status')
      expect(page).to have_text(@him.profile.name)
    end

    it 'send friend request' do
      login_as(@me)
      visit profile_path(@him)
      expect(page).to have_css('.btn.f_req')

      click_link 'Send Friend Request'
      expect(page).to have_text('Sent a Friend Request')
    end

    it 'accept friend request' do
      login_as(@me)
      visit profile_path(@him)
      expect(page).to have_css('.btn.f_req')

      click_link 'Send Friend Request'
      expect(page).to have_text('Sent a Friend Request')

      logout(@me)

      login_as(@him)

      visit profile_path(@him)
      expect(page).to have_text("It's You")
      expect(page).to have_text(@him_prof.name)
      expect(page).not_to have_text('Sent a Friend Request')
      expect(page).to have_css('.btn-danger')

      click_link 'Pending Friend Request 1'
      sleep 1
      expect(current_path).to eq(pending_requests_user_path(@him))
      expect(page).to have_text(@me_prof.name)

      click_link @me_prof.name
      sleep 1
      expect(current_path).to eq(profile_path(@me))

      click_link 'Accept'
      expect(page).to have_text(@him.profile.name)
    end

    it 'decline friend request' do
      login_as(@me)
      visit profile_path(@him)
      expect(page).to have_css('.btn.f_req')

      click_link 'Send Friend Request'
      expect(page).to have_text('Sent a Friend Request')

      logout(@me)

      login_as(@him)

      visit profile_path(@him)
      expect(page).to have_text("It's You")
      expect(page).to have_text(@him_prof.name)
      expect(page).not_to have_text('Sent a Friend Request')
      expect(page).to have_css('.btn-danger')

      click_link 'Pending Friend Request 1'
      sleep 1
      expect(current_path).to eq(pending_requests_user_path(@him))
      expect(page).to have_text(@me_prof.name)

      click_link @me_prof.name
      click_link 'Decline'
      sleep 1
      expect(current_path).to eq(profile_path(@me))

      visit profile_path(@me)
      expect(current_path).to eq(profile_path(@me))
      expect(page).not_to have_text('Decline')
    end
    it 'remove friend'
    it 'check friendship'
    it 'check requested friends'
    it 'check pending friends'
    it 'check all friends'
  end
end
