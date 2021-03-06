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

  resources :users, only: [:new, :create] do
    resources :phrases, only: [:index]
  end
  

  # Manual routing for delete since there will not be a show page for situations... situations show redirects to index.
  get '/situations/:id/destroy' => 'situations#destroy'
  get '/situations/:id/edit' => 'situations#edit'

  # Nested Routing for Phrases. NOTE: Phrases "Show" redirects to situations/:id/phrases index (index serves as show; show redirects to index)
  resources :situations do
    resources :phrases, except: [:destroy, :edit, :update]
  end

  # a page that lists all phrases ...

  # Manual routing for phrase edit that redirects to index
  get "/situations/:situation_id/phrases/:phrase_id/edit" => 'phrases#edit'
  patch "/situations/:situation_id/phrases/:phrase_id" => 'phrases#update'
  get "/situations/:situation_id/phrases/:phrase_id/destroy" => 'phrases#destroy'
  get "/situations/:situation_id/phrases" => "phrases#index"

  #THIS IS THE BEGINNING OF THE FLASHCARDS LOGIC LOOP, THE ROUTES BELOW ARE IN ORDER
  #get '/users/:id/flashcards' => "scores#index" #this was vestigial code, I don't seem to need it.
  post '/users/:id/flashcards' => "scores#index" #the user sees the scores and is allowed to click what they want

  post '/users/:id/flashcards/study_time' => "scores#show" #Routes to flashcard_first view... with unpopulated answer.
  get '/users/:id/flashcards/study_time' => "scores#show" #this is vestigial code, but perhaps I'll need it when redirecting from scores update.

  get '/users/:id/flashcards/:phrase_id/study_time_show_answer' => "scores#edit" #Routes to flashcard with solution
  patch '/users/:id/flashcards/:phrase_id/study_time_rank_familiarity' => "scores#update" #Routes to flashcard_with_score

  #Routes to Select Scores (this should mimic the situaton index checkboxes)... this should be on scores controller



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html <- this line was autogenerated.

  #get '*path' => redirect('/') <--not really sure how this works, will use it if I can figure it out.
end
