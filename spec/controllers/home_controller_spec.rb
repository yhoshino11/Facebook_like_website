require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'with sign in' do
    before do
      @user = create(:user)
      sign_in(@user)
    end

    it 'GET #index' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'without sign in' do
    it 'GET #index' do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
