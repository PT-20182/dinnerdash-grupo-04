Rails.application.routes.draw do
  devise_for :users

  resources :users
  resources :orders
  resources :meal_categories
  resources :meals

  put "/add_item", to: 'cart#add_item', as: 'add_item'
  put "/remove_item", to: 'cart#remove_item', as: 'remove_item'
  get "/cart", to: 'cart#show', as: 'cart'
  put "/delete", to: 'cart#delete', as: 'delete'

  get 'home/index'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
