Rails.application.routes.draw do
  # devise_for :users
  devise_for :users
  get 'items/index'
  get 'items/item_list', to: 'items#item_list', as: 'items_item_list'
  get 'users/:id', to: 'users#show', as: 'user'
  
  
  
  root to: "items#index"
  resources :items do
    member do
      get 'next'
      get 'previous'
    end
    resources :comments, only: [:create, :destroy]
    resources :orders, only: [:create, :index]
  end
end
