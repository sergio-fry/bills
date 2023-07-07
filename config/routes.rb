Rails.application.routes.draw do
  root 'home#show'
  get 'healthcheck', to: 'healthcheck#show'

  resources :organizations do
    resources :transactions
    resources :incomes
    resources :expenses
    resources :memberships
  end

  devise_for :users
end
