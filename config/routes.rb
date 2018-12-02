Rails.application.routes.draw do
  devise_for :users

  resources :meal_categories
  resources :meals

  get 'users/all'
  get 'users/show'
  
  get 'home/index'
  
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
