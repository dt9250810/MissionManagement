Rails.application.routes.draw do
  root 'pages#homepage'

  get '/signup' => 'users#new', as: 'signup'
  resources :users

  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  delete '/login' => 'sessions#destroy', as: 'logout'

  resources :users do
    resources :missions
  end
  
end
