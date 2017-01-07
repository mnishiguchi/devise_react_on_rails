class StaticPagesController < ApplicationController
  before_action :set_current_identity

  def home
    # ap "current_identity: #{current_identity} at static_pages#home"
    # ap "current_user:     #{current_identity&.user} at static_pages#home"
  end
end
