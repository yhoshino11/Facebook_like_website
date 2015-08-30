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
#  born_country        :integer
#  born_city           :integer
#  residence_country   :integer
#  residence_city      :integer
#  status              :integer
#  sex                 :integer
#

class Profile < ActiveRecord::Base
  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' },
                             default_url: '/images/:style/missing.png'
  validates_attachment_content_type :avatar,
                                    content_type: ['image/png',
                                                   'image/jpeg']
  belongs_to :user
end
