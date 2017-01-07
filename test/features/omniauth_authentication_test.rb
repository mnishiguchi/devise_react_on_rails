require "test_helper"
require "support/omniauth_utils"
require "support/authentication_utils"


feature "omniauth authentication" do

  OmniAuth.config.test_mode = true

  let(:identity_email) { "nishiguchi.masa@example.com" }


  # ---
  # ---


  scenario "new user when oauth provides email" do

    set_omniauth_google_oauth2
    assert Identity.count == 0

    # Log in with google_oauth2 for the first time.
    visit "/auth/auth/google_oauth2"
    assert_content page, I18n.t("devise.omniauth_callbacks.success", kind: "Google")
    assert_current_path "/"
  end


  # ---
  # ---


  scenario "new user when oauth does not provide email" do

    set_omniauth_twitter
    assert Identity.count == 0

    # Log in with twitter for the first time.
    visit "/auth/auth/twitter"
    assert_content page, "Please enter your email address."

    # We send the user a confirmation email because the auth_hash did not contain email.
    # Without email we cannot check who this user is.
    fill_in "Email", with: identity_email
    click_on "Send confirmation email"
    assert_current_path "/"

    # Click on the confirmation url in the user's inbox.
    visit confirmation_url(Identity.last)
    assert_content page, "#{identity_email}"
    assert_content page, I18n.t("devise.confirmations.confirmed")

    # Try to access the confirmation url again.
    visit confirmation_url(Identity.last)
    assert_content page, I18n.t("devise.confirmations.failure")

    # Log out.
    click_on "Log out"
    assert_content page, I18n.t("devise.sessions.signed_out")
    assert_current_path "/"

    # Log in with twitter.
    visit "/auth/auth/twitter"
    assert_content page, I18n.t("devise.omniauth_callbacks.success", kind: "Twitter")
  end


  # ---
  # ---


  scenario "connecting logged-in user to social profiles" do

    def assert_providers(provider_names)
      assert_equal(provider_names, Identity.last.social_profiles.pluck(:provider))
    end

    assert Identity.count == 0

    # Log in with google_oauth2 for the first time.
    set_omniauth_google_oauth2
    visit "/auth/auth/google_oauth2"
    assert_content page, I18n.t("devise.omniauth_callbacks.success", kind: "Google")

    # Connect to twitter account in the settings page.
    set_omniauth_twitter
    visit "/auth/auth/twitter"
    assert_content page, I18n.t("devise.omniauth_callbacks.connected", kind: "Twitter")
    assert_providers(["twitter", "google_oauth2"])

    # Disconnect from twitter account in the settings page.
    find("a[href='#{social_profile_path(Identity.last.social_profile(:twitter))}']").click
    assert_content page, I18n.t("devise.omniauth_callbacks.disconnected", kind: "Twitter")
    assert_providers(["google_oauth2"])

    # User does not have a facebook account but tries to connect to facebook account in the settings page.
    set_omniauth_facebook
    visit "/auth/auth/facebook"
    assert_providers(["google_oauth2"])
  end

end
