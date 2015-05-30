Rails.application.routes.draw do

  get "log_out" => "sessions#destroy"
  post "log_in" => "sessions#create"
  post "sign_up" => "users#create"
  get "get_items" => "items#get_items"
  get "item_liked" => "items#like_item"
  get "user_matches" => "users#user_matches"
  # root :to => "users#new"
  resources :users
  resources :sessions
end
