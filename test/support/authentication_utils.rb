def confirmation_url(identity)
  "/auth/confirmation?confirmation_token=#{identity.confirmation_token}"
end
