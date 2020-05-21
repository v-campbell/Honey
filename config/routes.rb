Rails.application.routes.draw do
  get 'worker_bees/show'
  root to: 'worker_bees#show'

  namespace :api, defaults: {format: :json} do
    resources :combs, only: [:show] do
      resources :worker_bees, only: [:index, :show, :update]
      resources :advisements, only: [:index, :show, :update]
    end
  end  
  
end
