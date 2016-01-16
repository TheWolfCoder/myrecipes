Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  root to: 'pages#home'
  resources :recipes do
    member do
      post 'like'
    end
  end
  
  resources :chefs, except: [:new, :destroy]
  
  get '/register', to: 'chefs#new'
  
  get '/login', to: "logins#new"
  post '/login', to: "logins#create"
  get '/logout', to: "logins#destroy"
  
  resources :styles, only: [:new, :create, :show]
  resources :ingredients, only: [:new, :create, :show]
  resources :reviews
 # login -> new session
  #logout -> close session
  #post login -> create session
  
end
