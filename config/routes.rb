Rails.application.routes.draw do
  root 'pages#homepage'

  get '/signup' => 'users#new', as: 'signup'
  resources :users, only: [:new, :create]

  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  delete '/login' => 'sessions#destroy', as: 'logout'

  resources :users do
    resources :missions
  end
  
  scope :admin do
    resources :users, except: [:new, :create, :destroy, :show]
    post '/:id/set_admin' => 'users#set_admin', as: 'set_admin_user'
  end

end
