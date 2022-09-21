Rails.application.routes.draw do

  devise_for :admin, controllers: {
  sessions: "admin/sessions"
}
devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  
  namespace :admin do
  
    resources :items, only: [:edit, :index, :new, :show, :create, :update]
    resources :genres, only: [:index,:edit,:create,:update]
    resources :customers, only: [:index,:edit,:show,:update]

  end


  scope module: :public do

  resources :deliveries, only: [:create, :index, :show, :edit, :update, :destroy]
  

    root to: "homes#top"
    get 'homes/about'
    resources :items, only: [:index, :show]
    resources :orders, only: [:new, :create, :index, :show ]
    post 'orders/confirm' => "orders#confirm"
    get 'orders/thanks' => "orders#thanks"
  end
  #あとで消す

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end

