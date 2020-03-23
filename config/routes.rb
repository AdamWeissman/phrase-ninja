Rails.application.routes.draw do

  get 'about', to: 'users#about'

  #"setup routes"
  root 'users#home_method'

  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'

  # Routes for Google authentication
  get 'auth/google_oauth2', to: redirect('auth/google_oauth2'), as: 'google_login'
  get 'auth/:provider/callback', to: 'sessions#google_auth'
  get 'auth/failure', to: redirect('/')

  #resources :phrase_scores

  resources :situations, only: [:index, :new, :create, :edit, :destroy, :patch]
  resources :users, only: [:new, :create]
  resources :phrases, only: [:index, :show]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #get '*path' => redirect('/')
end
