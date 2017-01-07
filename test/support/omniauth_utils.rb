# https://github.com/intridea/omniauth/wiki/Integration-Testing

# def set_invalid_omniauth
#   OmniAuth.config.mock_auth[:twitter] = :invalid_credentials
# end


# This represents an invalid auth.
def set_omniauth_facebook
  OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
end


# An auth hash for a twitter account.
# This DOES NOT contain user email.
def set_omniauth_twitter
  OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
    "provider" => "twitter",
    "uid"  => "12345678",
    "info" => {
      "name"  => "Mock User",
      "image" => "http://mock_image_url.com",
      "urls"  => {
        "Website" => nil,
        "Twitter" => "https://twitter.com/MNishiguchiDC"
      }
    },
    "credentials" => {
       "token"  => "8nBsIqnY4ip3nF2DHO4INw",
       "secret" => "8nBsIqnY4ip3nF2DHO4INw"
    },
    "extra" => {
      "raw_info" => {
        "name" => "Mock User",
        "id"   => "12345678"
      }
    }
  })
end


# An auth hash for a google account.
# This DOES NOT contain user email.
def set_omniauth_google_oauth2
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
         "provider" => "google_oauth2",
              "uid" => "12345678",
             "info" => {
                "name" => "Masatoshi Nishiguchi",
               "email" => "nishiguchi.masa@gmail.com",
          "first_name" => "Masatoshi",
           "last_name" => "Nishiguchi",
               "image" => "https://lh4.googleusercontent.com",
                "urls" => {
              "Google" => "https://plus.google.com/12345678"
          }
      },
      "credentials" => {
               "token" => "8nBsIqnY4ip3nF2DHO4INw",
          "expires_at" => 1473112399,
             "expires" => true
      },
            "extra" => {
          "id_token" => "8nBsIqnY4ip3nF2DHO4INw",
           "id_info" => {
                         "iss" => "accounts.google.com",
                     "at_hash" => "8nBsIqnY4ip3nF2DHO4INw",
                         "aud" => "8nBsIqnY4ip3nF2DHO4INw.apps.googleusercontent.com",
                         "sub" => "12345678",
              "email_verified" => true,
                         "azp" => "8nBsIqnY4ip3nF2DHO4INw.apps.googleusercontent.com",
                       "email" => "nishiguchi.masa@gmail.com",
                         "iat" => 1473108800,
                         "exp" => 1473112400
          },
          "raw_info" => {
                        "kind" => "plus#personOpenIdConnect",
                      "gender" => "male",
                         "sub" => "12345678",
                        "name" => "Masatoshi Nishiguchi",
                  "given_name" => "Masatoshi",
                 "family_name" => "Nishiguchi",
                     "profile" => "https://plus.google.com/12345678",
                     "picture" => "https://lh4.googleusercontent.com/",
                       "email" => "nishiguchi.masa@gmail.com",
              "email_verified" => "true",
                      "locale" => "en"
          }
      }
  })
end
