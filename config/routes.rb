Rails.application.routes.draw do
  get 'homes/top'
  get 'homes/about'
  root 'post_users#show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :index, :edit]
  resources :books, only: [:show, :index, :edit]
end
