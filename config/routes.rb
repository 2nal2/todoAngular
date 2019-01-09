Rails.application.routes.draw do
  resources :products
  resources :presentations
  resources :measures
  resources :product_categories
  get 'home/dashboard'
  resources :tests
  resources :countries
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
