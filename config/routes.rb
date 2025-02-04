Rails.application.routes.draw do
  # mount_devise_token_auth_for 'User', at: 'auth'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  } 
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # mount_devise_token_auth_for 'User', at: 'auth'

  # mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api do
    namespace :v1 do
      resources :posts, only: [:index]
    end
  end
  # namespace :users do
  #   # Sign up route
  #   get '/ap', to: 'registrations#create'
  #   # post 'auth/sign_up', to: 'registrations#create'
  #   # Sign in route
  #   post 'auth/sign_in', to: 'sessions#create'
  # end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
