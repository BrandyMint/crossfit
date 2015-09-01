Rails.application.routes.draw do
  root 'dashboard#index'

  resources :exercises
  resources :workouts
end
