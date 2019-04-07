Rails.application.routes.draw do
  
  root to: 'store#index'
  get 'store/index'

  scope '/admin' do
    get '', to: 'admin#dashboard', as: 'admin'
    get 'dashboard', to: 'admin#dashboard'

    resources :products do
      resources :product_prices
    end

    resources :customers
    get 'customers/:id/new_user', to: "customers#new_user", as: "customer_new_user"
    get 'customers/:id/edit_user', to: "customers#edit_user", as: "customer_edit_user"
    post 'customers/:id/user', to: "customers#create_user", as: "customer_user"
    patch 'customers/:id/user', to: "customers#update_user"

    resources :measures
    resources :product_categories

    resources :countries do
      resources :provinces
    end

    resources :employees
    get 'employees/:id/new_user', to: "employees#new_user", as: "employee_new_user"
    get 'employees/:id/edit_user', to: "employees#edit_user", as: "employee_edit_user"
    post 'employees/:id/user', to: "employees#create_user", as: "employee_user"
    patch 'employees/:id/user', to: "employees#update_user"
  end

  get '/activate_account', to: "users#activate_user"

  get '/countries/active', to: "countries#active"
  get '/countries/:country_id/provinces/active', to: "provinces#active"

  devise_for :users, controllers: { sessions: 'users/sessions' }
  
end
