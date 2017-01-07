module BackendUser
  extend ActiveSupport::Concern

  included do
    has_one :identity, as: :backend_user
  end

end
