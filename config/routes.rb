Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :movies
      get 'transactions/movies/:id' => 'transactions#index' # , as:
      resources :sales, only: %i[create]
      resources :rentals, only: %i[create]
      resources :likes, only: %i[create]
    end
  end
end
