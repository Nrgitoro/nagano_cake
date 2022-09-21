Rails.application.routes.draw do

  devise_for :admins
  devise_for :customers
  
  namespace :admin do
  resources :items
  
  end
  
  namespace :admin do
    resources :items

  end

  scope module: :public do
    root to: "homes#top"
     get 'homes/top'
    get 'homes/about'
    resources :items
    resources :orders, only: [:new, :create, :index, :show ]
    post 'orders/confirm' => "orders#confirm"
    get 'orders/thanks' => "orders#thanks"
  end
  #あとで消す
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
