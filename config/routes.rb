Rails.application.routes.draw do
  devise_for :users
  root 'home#show'
  get 'healthcheck', to: 'healthcheck#show'

  resources :organizations
end
