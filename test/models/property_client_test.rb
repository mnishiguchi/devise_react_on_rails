# == Schema Information
#
# Table name: property_clients
#
#  id                   :integer          not null, primary key
#  name                 :string
#  account_executive_id :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require "test_helper"

describe PropertyClient do

  subject { create(:management_client) }

  it "should be valid" do
    assert subject.valid?
  end
end
