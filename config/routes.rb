Rails.application.routes.draw do

  get 'relationships/followings'
  get 'relationships/followers'
  devise_for :users
  root 'homes#top'
   get 'home/about' => 'homes#about'

  resources :books do
    resource:favorites,only:[:create,:destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  
 get "search" => "searches#search"

end