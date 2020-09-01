Rails.application.routes.draw do
  # get 'list_items/update
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'items#index'
  resources :items
  resources :cart, only: [:create, :update, :new, :destroy, :show]
  resources :list_items, only: [:create, :update, :new, :destroy]
end
