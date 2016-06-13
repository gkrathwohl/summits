Rails.application.routes.draw do
  resources :indexed_activities
  get "/users/connect/" => "users#connect"
  get "/users/home" => "users#home"
  get "/map" => "users#map"
  get "/users/get_summits/:id" => "users#get_summits"
  get "/users/get_activities/:id" => "users#get_activities"
  get "/map_activities/:id" => "users#map_activities"
  get "/users/get_status/:id" => "users#get_status"
  get "/summit_lists" => "summit_list#index"
  resources :summit_completions
  root to: 'users#home'

  devise_for :users
  resources :users
end
