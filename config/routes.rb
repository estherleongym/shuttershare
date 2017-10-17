Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static#landing'

  resources :sessions, controller: "sessions", only: [:new, :create, :destroy, :index]
  resources :users, controller: "users", only: [:create, :update, :show, :destroy, :new] do
  resources :photos
  end

  get "/users/edit/:id" => "users#edit", as: "edit_profile"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  get "/users/fb_login/:id" => "users#fb_login", as: "fb_login"
  post "/users/set_username" => "users#set_username", as: "set_username"
  post "/search" => "users#search", as: "search"
  get "/users/verification/:user_id" => "braintree#new", as: "new_verification"
  post "/users/verification/:user_id" => "braintree#payment", as: "verification"
end
