# == Schema Information
#
# Table name: management_clients
#
#  id                   :integer          not null, primary key
#  name                 :string
#  account_executive_id :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class ManagementClient < ApplicationRecord
  include BackendUser

  has_many :property_clients

  def can_access(model)
    case model
    when Admin
      false
    when ManagementClient
      self == model
    end
  end
end
