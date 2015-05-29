Rails.application.routes.draw do
  get "log_out" => "sessions#destroy"
  post "log_in" => "sessions#create"
  post "sign_up" => "users#create"
  # root :to => "users#new"  resources :sessions
  get "get_items" => "items#get_items"
  # root :to => "users#new"
  resources :users
  resources :sessions
end
