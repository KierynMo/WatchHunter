Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :watches, only: [:index, :show, :new, :create, :destroy] do
    resources :bookings, only: [:new, :create]
  end
  
  resources :bookings, only: [:destroy]
  resources :users, only: [:new, :create, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
