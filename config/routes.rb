Rails.application.routes.draw do

  devise_for :admin, controllers: {
  sessions: "admin/sessions"
}
devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  namespace :admin do

    get '/' => "homes#top"

    resources :items, only: [:index, :new, :show, :edit, :create, :update]
    resources :genres, only: [:index,:edit,:create,:update]
    resources :customers, only: [:index,:edit,:show,:update]
    resources :orders, only: [:show,:update]
    resources :order_details, only: [:update]
  end


  scope module: :public do

    get 'orders/confirm' => "orders#confirm"
    post 'orders/confirm' => "orders#confirm"
    get 'orders/about' => "orders#thanks"

    root to: "homes#top"
    get 'homes/about'
    delete 'cart_items/destroy_all' => "cart_items/dstoroy_all"
    resources :cart_items, only: [:create, :index, :update, :destroy]
    get "/customers/show" => "customers#show", as: "customer"
    patch 'customers/update' => "customers#update"
    get 'customers/mypage/edit' => "customers#edit"
    get 'customers/confirm' => "customers#confirm"
    patch 'customers/withdrow' => "customers#withdrow"
    get '/customes/confirm' => "customers#confirm"
    patch '/customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    resources :items, only: [:index, :show, :create]
    resources :orders, only: [:new, :create, :index, :show ]
    resources :deliveries, only: [:index, :edit, :create, :update, :destroy]

  end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end