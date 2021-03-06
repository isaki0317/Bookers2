Rails.application.routes.draw do
  get 'home/about' => 'homes#about'
  root to: 'homes#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :index, :edit, :create, :update]
  resources :books
end
