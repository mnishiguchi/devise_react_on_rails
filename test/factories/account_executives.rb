# == Schema Information
#
# Table name: account_executives
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :account_executive do
    sequence(:name)    { |n| "account_executive_#{n}"}
  end
end
