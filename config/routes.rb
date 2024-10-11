Rails.application.routes.draw do
  resources :classifications
  resources :favorites
  resources :reviews
  resources :surveys
  resources :dependents
  resources :categories
  resources :questions
  resources :admins
  resources :users
  resources :organizations
  root "pages#home"
  get 'pages/home'
  resources :events
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  #get /admins
  get "admin", to: "admins#index"
  delete "logout", to: "admins#destroy"
end
