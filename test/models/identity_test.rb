# == Schema Information
#
# Table name: identities
#
#  id                     :integer          not null, primary key
#  backend_user_type      :string
#  backend_user_id        :integer
#  user_id                :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require "test_helper"

class IdentityTest < ActiveSupport::TestCase
  # it "must be a real test" do
  #   flunk "Need real tests"
  # end
end
