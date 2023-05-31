Rails.application.routes.draw do
  root 'home#show'
  get 'healthcheck', to: 'healthcheck#show'

  resources :organizations
end
