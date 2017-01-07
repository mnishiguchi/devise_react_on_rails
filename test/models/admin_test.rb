# == Schema Information
#
# Table name: admins
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

describe Admin do

  subject { create(:admin) }

  it "should be valid" do
    assert subject.valid?
  end
end
