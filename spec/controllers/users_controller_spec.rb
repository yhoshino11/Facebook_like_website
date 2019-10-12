require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  render_views

  before do
    @user          = create(:user)
    @profile       = create(:profile, user_id: @user.id)
    @other         = create(:user)
    @other_profile = create(:profile, user_id: @other.id)
  end 

  describe 'send_request' do

    before do
      sign_in @user
      get :send_request, params: { id: @other.id }
    end 

    it { expect(assigns(:target)).to eq(@other) }
    it { expect(@user.friends_with?(@other)).to(be_falsey) }
  end

  describe 'pending_requests' do
    before do
      @user.friend_request(@other)
      sign_in @other
      get :pending_requests, params: { id: @other.id }
    end 

    it { expect(@user.friends_with?(@other)).to(be_falsey) }
    it { expect(@other.friends_with?(@user)).to(be_falsey) }
    it { expect(assigns(:p_requests)).to eq([@user]) }
  end

  describe 'accept_request' do
    before do
      @user.friend_request(@other)
      sign_in @other
      get :accept_request, params: { id: @user.id }
    end 

    it { expect(assigns(:target)).to eq(@user) }
    it { expect(@user.friends_with?(@other)).to(be_truthy) }
    it { expect(@other.friends_with?(@user)).to(be_truthy) }
  end

  describe 'decline_request' do
    before do
      @user.friend_request(@other)
      sign_in @other
      get :decline_request, params: { id: @user.id }
    end 

    it { expect(assigns(:target)).to eq(@user) }
    it { expect(@other.requested_friends).to eq([]) }
  end

  describe 'unfriend' do
    before do
      @user.friend_request(@other)
      @other.accept_request(@user)
      sign_in @other
      get :unfriend, params: { id: @user.id }
    end 

    it { expect(@user.friends_with?(@other)).to(be_falsey) }
    it { expect(@other.friends_with?(@user)).to(be_falsey) }
  end
end
