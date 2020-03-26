Rails.application.routes.draw do

  #testing trial
  get 'about', to: 'users#about'

  # Initial Routes for the User, Signup, Login, Logout
  root 'users#home_method'

  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'

  # GOOGLE AUTHENTICATION
  get 'auth/google_oauth2', to: redirect('auth/google_oauth2'), as: 'google_login'
  get 'auth/:provider/callback', to: 'sessions#google_auth'
  get 'auth/failure', to: redirect('/')

  resources :users, only: [:new, :create]

  # Manual routing for delete since there will not be a show page for situations... situations show redirects to index.
  get '/situations/:id/destroy' => 'situations#destroy'
  get '/situations/:id/edit' => 'situations#edit'

  # Nested Routing for Phrases. NOTE: Phrases "Show" redirects to situations/:id/phrases index (index serves as show; show redirects to index)
  resources :situations do
    resources :phrases
  end

  # Manual routing for phrase edit that redirects to index
  get "/situations/:id/phrases/:id/edit" => 'phrases#edit'
  get "/situations/:id/phrases/:id/destroy" => 'phrases#destroy'

  # This route is entered manually on the phrases index view; and the destroy method redirects to the phrases index for a given situation
  get '/situations/:id/phrase/:id' => 'phrases#destroy'

  # These routes below are as of yet untested.
  get '/situations/:id/phrase/:id/edit' => 'situations#edit'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html <- this line was autogenerated.

  #get '*path' => redirect('/') <--not really sure how this works, will use it if I can figure it out.
end
