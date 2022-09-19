Rails.application.routes.draw do
  
  devise_for :admins
  devise_for :customers
  
  namespace :admin do
  resources :items
  
  end

  scope module: :public do
    
  get 'homes/top'
  get 'homes/about'
  
  resources :items
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
