# This module provides utitity classes to format params for creating a social
# profile record based on the result of OAuth authentication.
# NOTE: The subclass names must match provider names.
module SocialProfileParams
  class Base
    def params
      {
        uid:         @uid,
        name:        @name,
        nickname:    @nickname,
        email:       @email,
        url:         @url,
        image_url:   @image_url,
        description: @description,
        credentials: @credentials,
        raw_info:    @raw_info
      }
    end
  end

  class Facebook < SocialProfileParams::Base
    def initialize(auth)
      @provider    = auth.provider
      @uid         = auth.uid
      @name        = auth.info.name
      @nickname    = ""
      @email       = auth.info.email
      @url         = "https://www.facebook.com/#{@uid}"
      @image_url   = auth.info.image
      @description = ""
      @credentials = auth.credentials.to_json
      @raw_info    = auth.extra.raw_info.to_json
      freeze
    end
  end

  class GoogleOauth2 < SocialProfileParams::Base
    def initialize(auth)
      @provider    = auth.provider
      @uid         = auth.uid
      @name        = auth.info.name
      @nickname    = ""
      @email       = auth.info.email
      @url         = "https://plus.google.com/"
      @image_url   = auth.info.image
      @description = ""
      @credentials = auth.credentials.to_json
      @raw_info    = auth.extra.raw_info.to_json
      freeze
    end
  end

  class Twitter < SocialProfileParams::Base
    def initialize(auth)
      @provider    = auth.provider
      @uid         = auth.uid
      @name        = auth.info.name
      @nickname    = auth.info.nickname
      @email       = auth.info.email
      @url         = auth.info.urls["Twitter"]
      @image_url   = auth.info.image
      @description = auth.info.description.try(:truncate, 255)
      @credentials = auth.credentials.to_json
      @raw_info    = auth.extra.raw_info.to_json
      freeze
    end
  end
end
