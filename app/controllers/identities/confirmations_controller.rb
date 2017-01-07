# http://www.rubydoc.info/github/plataformatec/devise/Devise/ConfirmationsController
class Identities::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  def create
    self.resource = resource_class.send_confirmation_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      respond_with({}, location: after_resending_confirmation_instructions_path_for(resource_name))
    else
      respond_with(resource)
    end
  end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])

    if resource.errors.empty?
      sign_in(@identity)
      set_flash_message!(:notice, :confirmed)
      redirect_to "/"
    elsif @identity.duplicate_email?
      # If the same email is in the database and the old user account has no
      # social profiles associated with it, sign in the user with new account
      # and archive the old one by marking its email.
      email = @identity.email

      # Check if there is a user registered with the same email in the database
      # because email duplication is restricted.
      # We will keep the new one and archive the old one.
      if (old_identity = Identity.find_by email: email)
        @identity.merge_old_identity!(old_identity)
      end

      sign_in(@identity)
      set_flash_message!(:notice, :confirmed)
      redirect_to "/"
    else
      # If there are other errors, we cannot log in the user.
      flash[:danger] = I18n.t("devise.confirmations.failure")
      redirect_to "/"
    end
  end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end
end
