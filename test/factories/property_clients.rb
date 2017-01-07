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

FactoryGirl.define do
  factory :property_client do
    sequence(:name)    { |n| "property_client_#{n}"}
  end
end
