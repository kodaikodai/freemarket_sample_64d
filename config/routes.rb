Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: [:show, :edit, :update] do
    collection do
      get 'logout'
    end
  end
  resources :items, only: [:index, :show, :new, :create] do
    member do
      get 'buy'
      post 'pay'
      get 'checkout'
    end
  end
  resources :sell, only: [:index, :new, :create]
  resources :imeges, only: [:new, :create]
end
