Rails.application.routes.draw do
  get 'avatars/create'
  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'items#index'
  resources :items
  resources :cart, only: [:create, :update, :new, :destroy, :show]
  resources :list_items, only: [:create, :update, :new, :destroy]

  resources :charges
  

  resources :order, only: [:index, :show, :create, :update, :destroy]
  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end
end
