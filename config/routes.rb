Rails.application.routes.draw do
  
  devise_for :users
  root 'homes#top'
   get 'home/about' => 'homes#about'
  
  
  resources :users
  resources :books
  post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
  delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_'
  
 
  
end