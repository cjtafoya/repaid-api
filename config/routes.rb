Rails.application.routes.draw do

  post '/login', to: 'sessions#create'

  namespace :api do
    namespace :v1 do
      resources :users
      resources :gatherings
      resources :groups
      resources :attendees
      resources :expenses
    end
  end

end
