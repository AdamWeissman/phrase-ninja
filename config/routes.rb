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


  resources :users, only: [:new, :create]
  resources :situations, only: [:index, :new, :create, :edit, :update, :destroy, :show]

  #manual routing for delete since there will not be a show page for situations
  get '/situations/:id/destroy' => 'situations#destroy'
  get '/situations/:id/edit' => 'situations#edit'
  #resources :phrase_scores
  #resources :phrases, only: [:index, :edit, :update, :destroy, :new, :create]

  resources :situations do
    resources :phrases, only: [:index, :edit, :update, :destroy, :new, :create]
  end

  get '/situations/:id/phrase/:id/edit' => 'situations#edit'
  get '/situations/:id/phrase/:id' => 'phrases#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #get '*path' => redirect('/')
end
