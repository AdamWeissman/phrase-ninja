Rails.application.routes.draw do
  resources :languages
  resources :phrase_scores
  resources :phrases
  resources :emotions
  resources :situations
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
