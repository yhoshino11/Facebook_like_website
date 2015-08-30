FactoryGirl.define do
  factory :profile do
    name Faker::Name.name
    skype Faker::Internet.user_name
    twitter Faker::Internet.user_name
    github Faker::Internet.user_name
    livecodingtv Faker::Internet.user_name
  end
end
