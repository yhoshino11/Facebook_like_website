require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  describe 'GET #show' do

    render_views

    context 'can see profile' do

      before do
        @user = create(:user)
        @profile = create(:profile, user_id: @user.id)
        sign_in @user
        get :show,  params: { id: @user.id }
      end

      it { expect(response).to render_template(:show, id: @user.id ) }
      it { expect(assigns(:user)).to eq(@user) }
      it { expect(assigns(:country)).to eq("Signed in from #{@user.country}")}
      it { expect(assigns(:friends)).to eq([]) }
    end

    context 'if user has a friend' do

      before do
        @user = create(:user)
        @profile = create(:profile, user_id: @user.id)
        @other_user = create(:user)
        @other_profile = create(:profile, user_id: @other_user.id)
        sign_in @user
        @user.friend_request(@other_user)
        @other_user.accept_request(@user)
        get :show, params: { id: @user.id }
      end

      it { expect(assigns(:friends)).to eq([@other_user]) }
    end
  end
end
