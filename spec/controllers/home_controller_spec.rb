require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do

    context 'when user signed in' do

      render_views

      before do
        @user = create(:user)
        sign_in(@user)
      end

      it 'render home/index' do
        get :index
        expect(response).to render_template :index
      end
    end

    context 'when user is not signed in' do
      it 'redirect to sign in view' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
