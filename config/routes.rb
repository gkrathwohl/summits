Rails.application.routes.draw do
  resources :indexed_activities

  devise_for :users, :controllers => {:registrations => "registrations"}
  get "/connect_to_strava" => redirect("https://www.strava.com/oauth/authorize?client_id=3764&response_type=code&redirect_uri=" + Rails.application.config.domain_root + "/users/connect&approval_prompt=force"), :as => :connect
  
  get "/summits/:id" => "summits#show"
  #get "/summits" => "summits#index"

  get "/users/connect/" => "users#connect"

  get "/users/:id/map" => "users#map"
  get "/users/:id/lists" => "users#lists"
  get "/users/show" => "users#show"
  get "/users/:id/profile" => "users#profile"
  get "/users" => "users#index", as: "users"
  get "/lists" => "summit_list#index", as: "lists"
  get "/lists/:id" => "summit_list#show"
  get "/summits" => "summits#index", as: "summits"

  get "/users/get_summits/:id" => "users#get_summits"
  get "/users/get_activities/:id" => "users#get_activities"
  get "/users/get_activity/:id" => "users#get_activity"
  get "/map_activities/:id" => "users#map_activities"
  get "/users/get_status/:id" => "users#get_status"
  get "/summit_lists" => "summit_list#index"
  get "/scrape_peaks" => "summit_list#scrape_peaks"
  resources :summit_completions
  root to: 'users#home'

  #devise_for :users
  resources :users
end
