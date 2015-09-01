Rails.application.routes.draw do
  root 'dashboard#index'

  get 'signup' => 'signups#new'
  post 'signup' => 'signups#create'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :exercises
  resources :workouts
end
