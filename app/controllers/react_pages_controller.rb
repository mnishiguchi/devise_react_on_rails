class ReactPagesController < ApplicationController

  def index
    @props = {
      currentIdentity: current_identity,
      isLoggedIn:      identity_signed_in?,
    }
  end
end
