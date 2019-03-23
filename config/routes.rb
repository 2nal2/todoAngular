Rails.application.routes.draw do

  get 'store/index'
  get '', to: 'store#index', as: 'root'
  scope '/admin' do
    get '', to: 'admin#dashboard', as: 'admin'
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
    get 'employees/:id/new_user', to: "employees#new_user", as: "employee_new_user"
    get 'employees/:id/edit_user', to: "employees#edit_user", as: "employee_edit_user"
    post 'employees/:id/user', to: "employees#create_user", as: "employee_user"
    patch 'employees/:id/user', to: "employees#update_user"
  end

  get '/activate_account', to: "users#activate_user"

  get '/countries/active', to: "countries#active"
  get '/countries/:country_id/provinces/active', to: "provinces#active"

  devise_for :users, controllers: { sessions: 'users/sessions' }
=begin
  devise_for :users, :controllers => {
      confirmations: 'users/confirmations',
      passwords: 'users/passwords',
      registrations: 'users/registrations',
      sessions: 'users/sessions',
      unlocks: 'users/unlocks'
  }
end

=begin
  devise_scope :user do
    # make some pretty URLs
    get "login" => "users/sessions#new", :as => :new_user_session
    # post 'login' => 'users/sessions#create', :as => :user_session
    # delete "logout" => "users/sessions#destroy", :as => :destroy_user_session
    # rewrite the registrations URLs so they don't collide with my custom Users Controller
    get "sign_up" => "users/registrations#new", :as => :new_user_registration
    # put "update-registration" => "users/registrations#update", :as => :update_user_registration
    # delete "delete-registration" => "users/registrations#destroy", :as => :delete_user_registration
    get "edit-registration" => "users/registrations#edit", :as => :edit_user_registration
    get "cancel-registration" => "users/registrations#cancel", :as => :cancel_user_registration
    # post "create-registration" => "users/registrations#create", :as => :user_registration
  end
=end

  # devise_for :users, controllers: {
  #     sessions: 'users/sessions',
  #     registrations: 'users/registrations'
  # }

=begin
  devise_scope :users do
    get 'sign_up', to: 'users/registrations#new'
    get 'sign_in', to: 'users/sessions#new'
  end
=end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
