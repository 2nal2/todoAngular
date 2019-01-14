Rails.application.routes.draw do

  # get 'admin/dashboard'
  # get 'admin', to: "admin#index"
  # resources :tests
  # resources :countries

  scope '/admin' do
    get '', to: 'admin#dashboard'
    get 'dashboard', to: 'admin#dashboard'
    # resources :product_prices
    resources :products do
      resources :product_prices
    end
    resources :presentations
    resources :measures
    resources :product_categories
    resources :countries
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
