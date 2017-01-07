# == Schema Information
#
# Table name: social_profiles
#
#  id          :integer          not null, primary key
#  provider    :string
#  uid         :string
#  name        :string
#  nickname    :string
#  email       :string
#  url         :string
#  image_url   :string
#  description :string
#  others      :text
#  credentials :text
#  raw_info    :text
#  identity_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class SocialProfile < ApplicationRecord

  belongs_to :identity

  store      :others

  validates_uniqueness_of :uid, scope: :provider

  def save_omniauth_info(auth)
    # Create params in correct format, then update the profile.
    params = params_from_omniauth(auth)
    self.update_attributes(params) if valid_omniauth?(auth) && params.present?
  end

  def update_with_identity(identity)
    # NOTE: Profile identity and the specified identity must match.
    self.update!(identity_id: identity.id) unless self.identity == identity
  end

  def formatted_provider_name
    SocialProfile.format_provider_name(provider)
  end

  # Returns a SocialProfile object that corresponds to the specified data.
  def self.find_or_create_from_omniauth(auth)
    find_or_create_by(uid: auth.uid, provider: auth.provider).tap do |profile|
      profile.save_omniauth_info(auth)
    end
  end

  def self.format_provider_name(provider)
    (provider == "google_oauth2") ? "Google" : provider.capitalize
  end

  private

    # Returns params based on the specified authentication data.
    def params_from_omniauth(auth)
      return nil if auth['provider'].blank? || auth['provider'] == "default"
      class_name = auth['provider'].classify  # Facebook, Twitter etc.
      "SocialProfileParams::#{class_name}".constantize.new(auth).params
    end

    def valid_omniauth?(auth)
      (self.provider.to_s == auth['provider'].to_s) && (self.uid == auth['uid'])
    end
  end
