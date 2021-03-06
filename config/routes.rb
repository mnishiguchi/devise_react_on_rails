Rails.application.routes.draw do

  # Authentication
  devise_for :identities,
    controllers: {
      sessions:           "identities/sessions",
      passwords:          "identities/passwords",
      registrations:      "identities/registrations",
      confirmations:      "identities/confirmations",
      omniauth_callbacks: "identities/omniauth_callbacks"
    },
    # https://github.com/plataformatec/devise#configuring-routes
    path: 'auth',
    path_names: { sign_up: 'signup', sign_in: 'login', sign_out: 'logout' }

  # Ask for email address after successful OAuth.
  resources :email_confirmations, only: [:show, :update]

  # To demonstarate Pundit authorization
  resources :identities

  # Soial profiles
  resources :social_profiles

  # Frontend users
  resources :users

  # Backend users
  resources :admins, only: [:show]
  resources :account_executives, only: [:show]
  resources :management_clients, only: [:show]
  resources :property_clients, only: [:show]

  # NOTE: '/' needs to be places at the bottom of the list because we do not
  # want other paths to be ignored.
  root to: "react_pages#index"

  # For viewing delivered emails in development environment.
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
