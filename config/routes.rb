Rails.application.routes.draw do
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#create", :as => "log_in"
  get "sign_up" => "users#create", :as => "sign_up"
  # root :to => "users#new"
  resources :users
  resources :sessions
end
