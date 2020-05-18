Rails.application.routes.draw do
  root to: 'static_pages#root'

  get 'worker_bees/index'
  root to: 'worker_bees#index'

  namespace :api, defaults: {format: :json} do
    resources :combs, only: [:show] do
      resources :worker_bees, only: [:index, :show, :update]
    end
  end  
  
end
