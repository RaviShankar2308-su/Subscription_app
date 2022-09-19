Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root "static_public#landing_page"
  get 'privacy', to: "static_public#privacy"
  get 'terms', to: "static_public#terms"
end
