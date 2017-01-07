class EmailConfirmationsController < ApplicationController

  # GET   /email_confirmations/:id - Show email confirmation form
  def show
    @identity = Identity.find(params[:id])
  end

  # PATCH /email_confirmations/:id - Update identity data based on the form
  def update
    @identity = Identity.find(params[:id])

    @identity.skip_confirmation_notification!

    if sign_up_finished_but_email_not_confirmed? || only_error_is_duplicate_email?
      @identity.send_confirmation_instructions
      flash[:info] = I18n.t("devise.confirmations.send_instructions")
      redirect_to "/"
    elsif @identity.errors
      render :show
    else
      flash[:danger] = "Error registering email"
      redirect_to "/"
    end
  end

  private

    # Returns true if the identity was successfully signed up but
    # his/her email is not confirmed yet.
    def sign_up_finished_but_email_not_confirmed?
      @identity.update(identity_params) && !@identity.confirmed?
    end

    def only_error_is_duplicate_email?
      e_msgs = @identity.errors.messages
      e_msgs.size == 1 && e_msgs[:email].first =~ /taken/
    end

    def identity_params
      accessible = [ :email ]

      # Ignore password if password is blank.
      unless params[:identity][:password].blank?
        accessible << [ :password, :password_confirmation ]
      end

      params.require(:identity).permit(accessible)
    end

end
