Rails.application.routes.draw do
  require 'resque/server'
  mount Resque::Server, at: '/jobs'

  # home controller
  root 'home#index'
  
  # auth
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')

  # users
  get '/users/:id' => 'users#show', :as => 'show_user'








  resources :climb_records
  resources :indexed_activities

  #reports
  get '/reports' => 'reports#index'
  get '/reports/annual_report' => 'reports#annual_report'

  get '/users/:id/index_activities' => 'users#index_activities'

  get '/summits/:id' => 'summits#show' 
  #get '/summits' => 'summits#index'

  get 'users/:id/elevation' => 'users#elevation'

  #osm api
  get '/osm/get_summits' => 'osm#get_summits'

  get '/users/connect/' => 'users#connect'

  # tabs
  get '/users/show' => 'users#show'
  get '/users/:id/map' => 'users#map'
  get '/users/:id/lists' => 'users#lists'
  get '/users/:id/vertical' => 'users#vertical'

  get '/users/:id/profile' => 'users#profile'
  get '/users' => 'users#index', as: 'users'
  get '/lists' => 'summit_list#index', as: 'lists'
  get '/lists/:id' => 'summit_list#show'
  get '/summits' => 'summits#index', as: 'summits'

  get '/users/get_summits/:id' => 'users#get_summits'
  get '/users/get_activities/:id' => 'users#get_activities'
  get '/users/get_activity/:id' => 'users#get_activity'
  get '/map_activities/:id' => 'users#map_activities'
  get '/users/get_status/:id' => 'users#get_status'
  get '/users/activity_count/:id' => 'users#activity_count'
  get '/users/indexed_count/:id' => 'users#indexed_count'
  get '/summit_lists' => 'summit_list#index'
  get '/scrape_peaks' => 'summit_list#scrape_peaks'
  resources :summit_completions


  #devise_for :users
  resources :users
end
