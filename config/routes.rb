Rails.application.routes.draw do
  resources :memberships
  resources :members
  root 'home#show'
  get 'healthcheck', to: 'healthcheck#show'

  resources :organizations do
    resources :incomes
    resources :memberships
  end

  devise_for :users
end
