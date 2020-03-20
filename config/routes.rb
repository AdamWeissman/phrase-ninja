Rails.application.routes.draw do
  root 'users#home_method'

  get '/signup' => 'users#new'

  get '/login' => 'sessions#new' #REMEMBER!!! the sessions this is referring to is the SessionsController and the #new is the 'new' method within the controller...  the route where it is being called is here: <%= form_for (@user), url: '/login' do |f| %>.... in other words, that "url: "/login"" is in views/sessions/login.html.erb... and that's what syncs to the UsersController
  #comments continued from above line... in other words: the routes.rb file here in config is the intermediary between the user's experience on some given view page, the url submit method in the form which is referenced with the crud request and hashed to the controller and some #method which in turn renders, redirect_to or link_to some original view
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # Routes for Google authentication

  get 'auth/google_oauth2', to: redirect('auth/google_oauth2'), as: 'google_login'
  get 'auth/:provider/callback', to: 'sessions#google_auth'
  get 'auth/failure', to: redirect('/')

  resources :languages
  resources :phrase_scores
  resources :phrases
  resources :emotions
  resources :situations
  resources :users


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html




  #get '*path' => redirect('/')
end
