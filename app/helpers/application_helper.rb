module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title="")
    base_title = "Apartment showoff"
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  # Stores the URL that a user wants to access.
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end

  # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Returns the Gravatar image tag for the given user.
  def gravatar_for(user, options = { size: 80 })
    # Standardize on all lower-case addresses
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.email, class: "gravatar")
  end

  # Returns an image tag for the given user with one of his/her
  # social profile image if any.
  def social_image_for(user, options = { size: 80 })
    image_urls = user.social_profiles.pluck(:image_url)
    border = 4
    unless image_urls.empty?
      image_tag(image_urls.sample, size: options[:size] + border,
        alt: user.email, class: "gravatar")
    end
  end

  def current_user
    current_identity&.user
  end

  def current_backend_user
    current_identity&.backend_user
  end

  def link_to_user_page(text, options={})
    link_to(text, (current_user ? user_url(current_user) : root_url))
  end

  def link_to_backend_user_page(text, options={})
    url = if current_backend_user
            helper = "#{current_backend_user.class.name.underscore}_path"
            send(helper, current_backend_user)
          else
            root_url
          end
    link_to(text, url)
  end

  # Returns an image tag for the given user with one of his/her
  # social profile image if any.
  def social_profile_image(profile, options = { size: 80 })
    return nil if profile.nil?
    image_tag(profile.image_url, size: options[:size], alt: profile.identity.email)
  end


  # ---
  # Devise-related
  # https://github.com/plataformatec/devise/wiki/How-To:-Display-a-custom-sign_in-form-anywhere-in-your-app
  # ---


  def resource_name
    :identity
  end


  def resource
    @resource ||= Identity.new
  end


  def devise_mapping
    @devise_mapping ||= Devise.mappings[:identity]
  end
end
