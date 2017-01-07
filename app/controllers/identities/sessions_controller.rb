# https://github.com/plataformatec/devise/blob/master/app/controllers/devise/sessions_controller.rb
class Identities::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  respond_to :html, :js

  # GET /resource/sign_in
  # https://github.com/plataformatec/devise/wiki/How-To:-redirect-to-a-specific-page-on-successful-sign-in
  def new
    self.resource = resource_class.new(sign_in_params)
    store_location_for(resource, session[:forwarding_url])
    super
  end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    yield resource if block_given?

    if resource && resource.active_for_authentication?
      flash[:notice] = I18n.t("devise.sessions.signed_in")
      sign_in(resource_name, resource)
      redirect_to root_url
    else
      flash[:danger] = I18n.t("devise.failure.invalid")

      ap flash[:danger]

      respond_with resource, location: after_sign_in_path_for(resource)
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
