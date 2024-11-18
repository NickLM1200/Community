Rails.application.routes.draw do
  get 'pages/about_us'
  get 'pages/survey'

  namespace :administrator do
    resources :classifications
    resources :categories
    resources :organizations
    resources :admins
    resources :events
    resources :questions
    resources :reviews
    resources :surveys
    resources :users
  end


  resources :favorites

  resources :organizations do
    resources :reviews, only: [:index, :new, :create, :destroy]  # Allow adding and viewing reviews for organizations
    member do
      get 'explore', to: 'pages#explore', as: 'explore'
    end
  end

  resources :surveys, only: [:create]
  resources :dependents
  resources :questions
  resources :users, param: :username, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :events
  resources :organizations
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :user_organizations, only: [:show]
  root "pages#home"
  get 'pages/home'

  get 'food', to: 'pages#food', as: 'food'
  get 'housing', to: 'pages#housing', as: 'housing'
  get 'healthcare', to: 'pages#healthcare', as: 'healthcare'
  get 'education', to: 'pages#education', as: 'education'
  get 'childcare', to: 'pages#childcare', as: 'childcare'
  get 'legal_resources', to: 'pages#legal_resources', as: 'legal_resources'

  get 'pages/explore'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  #get /admins
  get "admin", to: "administrator/admins#dashboard"
  get "admindashboard", to: "administrator/admins#dashboard"

  get "adminaccess", to: "administrator/asession#new"
  post "adminaccess", to: "administrator/asession#create"
  delete "adminlogout", to: "administrator/asession#destroy"

  # User session management
  get "login", to: "sessions#new", as: :login   # Use the index action for displaying login form
  post "login", to: "sessions#create"  # Use the new login action for logging in
  delete "logout", to: "sessions#destroy", as: :logout # Use the destroy action for user logout

  get 'forgot_password', to: 'password_resets#new', as: :forgot_password
  
  # Edit route for the GET request to display the form
  get 'password_resets/:user_id/edit/:token', to: 'password_resets#edit', as: :custom_edit_password_reset

  # Update route for the PATCH request to submit the form and update the password
  patch 'password_resets/:user_id/edit/:token', to: 'password_resets#update'

  get 'contactus', to: 'contact_form#new'
  resources :contact_form, only: [:create]

  #route for search functionality
  get 'search', to: 'search#index'
end
