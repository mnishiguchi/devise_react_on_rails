class SocialProfilesController < ApplicationController
  before_action :authenticate_identity!, only: :destroy
  before_action :correct_identity!, only: :destroy

  def index
    @social_profiles = SocialProfile.all
  end

  def destroy
    @profile.destroy
    flash[:success] = I18n.t("devise.omniauth_callbacks.disconnected", kind: @profile.formatted_provider_name)
    redirect_to edit_identity_registration_url
  end

  private

    def correct_identity!
      @profile = SocialProfile.find(params[:id])
      unless @profile.identity_id == current_identity.id
        redirect_to root_url and return
      end
    end
end
