class Identities::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook;      omniauth_callback; end
  def google_oauth2; omniauth_callback; end
  def twitter;       omniauth_callback; end

  private

    # Invoked after omniauth authentication is done.
    # This method can handle authentication for all the providers.
    # Alias this method as a provider name such as `twitter`, `facebook`, etc.
    def omniauth_callback

      # Obtain the authentication data.
      @auth_hash = request.env["omniauth.auth"]
      provider_name = SocialProfile.format_provider_name(@auth_hash.provider)

      # Check if identity is alreadly signed in.
      if identity_signed_in?
        # Create a social profile from auth and associate that with current identity.
        profile = SocialProfile.find_or_create_from_omniauth(@auth_hash)
        profile.update_with_identity(current_identity)
        set_flash_message!(:notice, :connected, kind: provider_name)
        redirect_to(edit_identity_registration_url) and return
      end

      # Obtain identity for this auth info.
      @identity = Identity.find_or_create_from_omniauth(@auth_hash)
      if @identity.persisted? && @identity.email_verified?
        sign_in @identity
        set_flash_message!(:notice, :success, kind: provider_name)
        redirect_back_or "/"
      else
        @identity.reset_confirmation!
        flash[:warning] = "Please enter your email address to sign in or create an account on this app."
        redirect_to identity_finish_signup_url(@identity)
      end
    end
end
