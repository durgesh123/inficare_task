Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create]
  root 'users#index'
end