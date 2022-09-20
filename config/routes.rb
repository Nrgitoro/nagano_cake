Rails.application.routes.draw do
  
  get 'customers/index'
  get 'customers/show'
  get 'customers/edit'
  devise_for :admins
  devise_for :customers
  
 
  
  namespace :admin do
    resources :items
    resources :genres, only: [:index,:edit,:create,:update]
    resources :customers, only: [:index,:edit,:show,:update]

  end

  scope module: :public do
    resources :items

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end