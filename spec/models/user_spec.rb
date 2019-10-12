# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }

  describe 'def can_see_friends?' do
    before do
      @user = create(:user)
      @profile = create(:profile, user_id: @user.id)
      @other = create(:user)
      @other_profile = create(:profile, user_id: @other.id)
    end

    context 'if user is me' do
      it 'can see friends' do
        expect(@user.can_see_friends?(@user)).to(be_truthy)
      end

      it 'can see profile' do
        expect(@user.can_see_profile?(@user)).to(be_truthy)
      end
    end

    context 'if user is not me' do
      it 'can not see friends' do
	expect(@user.can_see_friends?(@other)).to(be_falsey)
      end

      it 'can not see profile' do
	expect(@user.can_see_profile?(@other)).to(be_falsey)
      end
    end

    context 'if user is a friend' do
      before do
        @user.friend_request(@other)
        @other.accept_request(@user)
      end

      it 'can see friends' do
	expect(@user.can_see_friends?(@other)).to(be_truthy)
      end

      it 'can see profile' do
	expect(@user.can_see_profile?(@other)).to(be_truthy)
      end
    end
  end
end
