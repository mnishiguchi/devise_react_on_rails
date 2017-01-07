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

class PropertyClient < ApplicationRecord
  include BackendUser

  belongs_to :account_executive, optional: true
  belongs_to :management_client, optional: true

  def can_access(model)
    case model
    when Admin, MitsContainer
      false
    else
      false
    end
  end
end
