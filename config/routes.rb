Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  resources :jobs , only: [:show, :new, :create, :edit, :update]
  resources :companies, only: [:show, :new, :create]
  resources :categories, only: [:new, :show, :create]
end
