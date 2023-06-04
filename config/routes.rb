Rails.application.routes.draw do
  resources :members
  root 'home#show'
  get 'healthcheck', to: 'healthcheck#show'

  resources :organizations do
    resources :incomes
  end
  devise_for :users
end
