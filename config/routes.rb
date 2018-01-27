Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :restaurants, only: :create
      resources :visitors, only: :create
    end
  end
end
