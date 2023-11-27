Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :events

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Trying out our weather route
  get '/weather/:city', to: 'weather#show', as: 'weather'

  # Defines the root path route ("/")
  # root "posts#index"
  root 'events#index'
  
end
