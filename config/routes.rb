Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  get 'items/item_list', to: 'items#item_list', as: 'items_item_list'
  
  root to: "items#index"
  resources :items do
    resources :orders, only: [:create, :index]
  end
end
