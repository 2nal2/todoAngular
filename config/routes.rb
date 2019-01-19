Rails.application.routes.draw do

  scope '/admin' do
    get '', to: 'admin#dashboard'
    get 'dashboard', to: 'admin#dashboard'

    resources :products do
      resources :product_prices
    end

    resources :presentations
    resources :measures
    resources :product_categories

    resources :countries do
      resources :provinces
    end

  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
