# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

describe User do

  subject { create(:management_client) }

  it "should be valid" do
    assert subject.valid?
  end
end
