Rails.application.routes.draw do
  get "log_out" => "sessions#destroy"
  get "log_in" => "sessions#create"
  get "sign_up" => "users#create"
  get "get_items" => "items#get_items"
  # root :to => "users#new"
  resources :users
  resources :sessions
end
