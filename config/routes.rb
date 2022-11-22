Rails.application.routes.draw do

  devise_for :users

  root to: 'homes#top'
  get 'homes/about', to: 'homes#about', as: 'about'

  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  resources :users, only: [:edit, :show, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
