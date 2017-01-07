class ReactPagesController < ApplicationController

  def index
    @props = {
      name:       "Stranger",
      isLoggedIn: identity_signed_in?
    }
  end
end
