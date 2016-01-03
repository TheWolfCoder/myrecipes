Rails.application.routes.draw do
  root to: 'pages#home'
  get '/home', to: 'pages#home'
  get '/pasta', to: 'pages#pasta'
  get '/reviews', to: 'pages#reviews'

end
