Rails.application.routes.draw do
  resources :languages
  resources :phrase_scores
  resources :phrases
  resources :emotions
  resources :situations
  resources :users

  get '/auth/:provider/callback' => 'sessions#omniauth' #from this tutorial https://medium.com/swlh/google-authentication-strategy-for-rails-5-application-cd37947d2b1b
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
