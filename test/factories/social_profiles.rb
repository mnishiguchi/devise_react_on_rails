# == Schema Information
#
# Table name: social_profiles
#
#  id          :integer          not null, primary key
#  provider    :string
#  uid         :string
#  name        :string
#  nickname    :string
#  email       :string
#  url         :string
#  image_url   :string
#  description :string
#  others      :text
#  credentials :text
#  raw_info    :text
#  identity_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :social_profile do
    provider "twitter"
    sequence(:uid)  { |n| (1000 + n).to_s }
    sequence(:name) { |n| "User_#{n} Example"}
    nickname    ""
    email       "user@example.com"
    url         "https://twitter.com/MNishiguchiDC"
    image_url   "https://pbs.twimg.com/profile_images/755494119997222912/ZZr9NyZZ_400x400.jpg"
    description ""
    others      "MyText"
    credentials "MyText"
    raw_info    "MyText"
    user
  end
end
