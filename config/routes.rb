Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root 'welcome#index'

  resource :dashboard

  get 'signup' => 'signups#new'
  post 'signup' => 'signups#create'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :exercises
  resources :workouts
  resources :wods
  resources :logs
end
