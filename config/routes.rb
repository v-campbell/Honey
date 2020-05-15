Rails.application.routes.draw do
  get 'worker_bees/index'

  root to: 'worker_bees#index'
  resources :worker_bees, only: [:index, :show, :update]
end
