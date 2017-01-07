require "test_helper"
require "support/omniauth_utils"
require "support/authentication_utils"

feature "password authentication" do

  let(:identity_email) { "nishiguchi.masa@example.com" }

  scenario "sign up with password" do

    visit root_path

    # Sign up with password.
    click_on "Sign up"
    assert_content page, /sign up/i

    fill_in "identity_email", with: identity_email
    fill_in "identity_password", with: "password"
    fill_in "identity_password_confirmation", with: "password"
    click_on "Email me a link to sign in"
    assert_current_path "/"

    # Click on the confirmation link in the inbox.
    visit confirmation_url(Identity.last)
    assert_content page, "#{identity_email}"
    assert_content page, I18n.t("devise.confirmations.confirmed")

    # Log out.
    click_on "Log out"
    assert_current_path "/"
  end
end
