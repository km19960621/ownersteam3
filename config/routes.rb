Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'orders#index'

  get 'sessions/new'

  resources :users
  get 'users/:id/orders', to: 'users#orders'
  get 'users/:id/random_orders', to: 'users#random_orders'
  get 'users/:id/cards', to: 'users#cards'

  resources :cards
  resources :orders

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
