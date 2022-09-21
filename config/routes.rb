Rails.application.routes.draw do

  devise_for :admins
  devise_for :customers

  namespace :admin do

  resources :items, only: [:edit, :index, :new, :show, :create, :update]

  end

  scope module: :public do

  resources :items, only: [:index, :show]

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end