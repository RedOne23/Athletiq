Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  resources :facilities do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:destroy]
  
  get '/bookings', to: 'bookings#list'
  delete '/bookings/:id', to: 'bookings#delete', as: 'bookings_delete'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
