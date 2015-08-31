# == Schema Information
#
# Table name: profiles
#
#  id                  :integer          not null, primary key
#  name                :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  user_id             :integer
#  skype               :string
#  twitter             :string
#  github              :string
#  livecodingtv        :string
#  born_country        :string
#  born_city           :integer
#  residence_country   :string
#  residence_city      :integer
#  status              :string
#  sex                 :integer
#

require 'rails_helper'

RSpec.describe Profile, type: :model do
  pending
end
