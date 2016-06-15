Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users
      resources :events
      resources :groups
      resources :attendees
      resources :expenses
    end
  end

end
