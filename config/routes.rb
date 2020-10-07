Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :comments
      resources :problems
      resources :dependents
      resources :users

      get '/persist', to: 'users#persist'
      post '/login', to: 'auth#create'
      get '/current_user', to: 'users#profile'
      # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    end
  end
end
