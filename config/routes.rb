Rails.application.routes.draw do
  resources :memberships
  resources :members
  root 'home#show'
  get 'healthcheck', to: 'healthcheck#show'

  resources :organizations do
    resources :transactions, only: :edit
    resources :incomes
    resources :expenses
    resources :memberships
  end

  devise_for :users
end
