Rails.application.routes.draw do
  resources :indexed_activities
  get "/users/connect/" => "users#connect"
  get "/users/home" => "users#home"
  get "/map" => "users#map"
  get "/users/get_summits/:id" => "users#get_summits"
  resources :summit_completions
  root to: 'users#home'

  devise_for :users
  resources :users
end
