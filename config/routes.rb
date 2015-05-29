Rails.application.routes.draw do
  post "log_out" => "sessions#destroy", :as => "log_out"
  post "log_in" => "sessions#create", :as => "log_in"
  post "sign_up" => "users#create", :as => "sign_up"
  # root :to => "users#new"
  resources :users
  resources :sessions
end
