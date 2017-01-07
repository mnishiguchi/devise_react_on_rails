class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  before_action :set_current_identity

  include ApplicationHelper

  # Set up the first arguemnt of Pundit's Policies.
  # NOTE: By default, Pundit uses current_user.
  def pundit_user
    current_identity
  end

  private

    # Makes current_identity accessible via Identity model.
    def set_current_identity
      Identity.current_identity = @current_identity
    end

    # Callback for Pundit NotAuthorizedError.
    def user_not_authorized
      flash[:alert] = "Access denied."
      redirect_to(request.referrer || "/")
    end
end
