# == Schema Information
#
# Table name: account_executives
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

describe AccountExecutive do

  subject { create(:account_executive) }

  it "should be valid" do
    assert subject.valid?
  end
end
