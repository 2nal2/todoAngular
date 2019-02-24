Rails.application.routes.draw do


  scope '/admin' do
    get '', to: 'admin#dashboard'
    get 'dashboard', to: 'admin#dashboard'

    resources :products do
      resources :product_prices
    end

    resources :customers
    resources :measures
    resources :product_categories

    resources :countries do
      resources :provinces
    end

    resources :employees
  end

  get '/countries/active', to: "countries#active"
  get '/countries/:country_id/provinces/active', to: "provinces#active"

  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }

  devise_scope :users do
    get 'sign_up', to: 'users/registrations#new'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
