# == Schema Information
#
# Table name: admins
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Admin < ApplicationRecord
  include BackendUser

  def account_executives
    AccountExecutive.all
  end

  def can_access(model)
    true
  end
end
