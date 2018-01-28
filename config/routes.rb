Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :restaurants, only: [:create, :update] do
        resources :tables, only: :create
      end
      resources :visitors, only: :create
    end
  end
end
