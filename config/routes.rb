Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :comments
      resources :problems
      resources :dependents
      resources :users
      resources :appointments
      resources :doctors
      
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/persist', to: 'users#persist'
      get '/reauth' , to: 'auth#reauth'
      # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    end
  end
end
