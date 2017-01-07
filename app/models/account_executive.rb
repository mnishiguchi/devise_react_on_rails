# == Schema Information
#
# Table name: account_executives
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AccountExecutive < ApplicationRecord
  include BackendUser

  has_many :management_clients
  has_many :property_clients


  # This is stupidely expensive....If we enforce the property clients to be through management clients we can make our lives a lot easier
  def all_property_clients
    [management_clients.map(&:property_clients), property_clients].flatten.uniq
  end

  def can_access(model)
    case model
    when Admin
      false
    when PropertyClient
      property_clients.include?(model)
    when ManagementClient
      managment_clients.include?(model)
    else
      false
    end
  end
end
