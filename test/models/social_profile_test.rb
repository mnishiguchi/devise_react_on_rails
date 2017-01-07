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

require "test_helper"

class SocialProfileTest < ActiveSupport::TestCase
  # it "must be a real test" do
  #   flunk "Need real tests"
  # end
end
