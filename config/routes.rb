Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :restaurants, only: [:create, :update] do
        resources :tables, only: :create
        resources :reservations, only: [:index, :create, :update]
      end
      resources :visitors, only: :create
    end
  end
end
