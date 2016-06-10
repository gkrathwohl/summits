Rails.application.routes.draw do
  resources :indexed_activities
  get "/users/connect/" => "users#connect"
  get "/users/home" => "users#home"
  resources :summit_completions
  root to: 'users#home'

  devise_for :users
  resources :users
end
