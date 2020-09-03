Rails.application.routes.draw do
  # get 'avatars/create'
  root to: 'items#index'
  get "/contact", to: "application#contact"

  devise_for :users
  resources :items, param: :slug
  resources :cart, only: [:create, :update, :new, :destroy, :show]
  resources :list_items, only: [:create, :update, :new, :destroy]

  resources :charges
  
  resources :order, only: [:index, :show, :create, :update, :destroy]
  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end
end