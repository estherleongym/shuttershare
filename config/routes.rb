Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static#landing'

  resources :users, controller: "users", only: [:create, :update, :show, :destroy, :new] do
  resources :photos
  end

end
