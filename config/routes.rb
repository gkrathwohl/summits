Rails.application.routes.draw do
  resources :indexed_activities
  get "/users/connect/" => "users#connect"
  get "/users/home" => "users#home"
  get "/users/:id/map" => "users#map"
  get "/users/map" => "users#map"
  get "/users/show" => "users#show"
  get "/users" => "users#index", as: "users"


  get "/map" => "users#map", as: "map"
  get "/summits" => "users#show", as: "summit"

  get "/users/get_summits/:id" => "users#get_summits"
  get "/users/get_activities/:id" => "users#get_activities"
  get "/users/get_activity/:id" => "users#get_activity"
  get "/map_activities/:id" => "users#map_activities"
  get "/users/get_status/:id" => "users#get_status"
  get "/summit_lists" => "summit_list#index"
  get "/scrape_peaks" => "summit_list#scrape_peaks"
  resources :summit_completions
  root to: 'users#home'

  devise_for :users
  resources :users
end
