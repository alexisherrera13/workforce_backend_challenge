Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :organisations
  resources :shifts
  root "sessions#new"
  get "signup" => "users#new"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  get "logout" => "sessions#destroy"
  get "join/:id/:organisation_id" => "users#join"
  get "leave/:id" => "users#leave"
  get "search" => "shifts#index"
  get "password/reset" => "password_reset#new"
  post "password/reset" => "password_reset#create"
  get "password/reset/edit" => "password_reset#edit"
  patch "password/reset/edit" => "password_reset#update"
end
