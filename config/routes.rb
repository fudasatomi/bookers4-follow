Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'
  devise_for :users
    resources :users,only: [:show,:index,:edit,:update]

  resources :books do
  	resource :favorites, only:[:create,:destroy]
  	resource :book_comments, only:[:create, :destroy]
  end
  resources :users do
    member do
     get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end