Rails.application.routes.draw do
  devise_for :users, path_names: {sign_up: 'registration', sign_in: 'login', sign_out: 'logout'}
  mount Attachinary::Engine => "/attachinary"

  resources :entries
  resources :users, only: :show
  resources :categories, path: 'menu'

  get '/delivery', to: 'pages#delivery'
  get '/about', to: 'pages#about'
  get '/contacts', to: 'pages#contacts'
  get '/admin', to: 'pages#admin'
  root to: 'pages#home'
end
