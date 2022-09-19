Rails.application.routes.draw do
  get 'homes/top'
  devise_for :admins
  devise_for :customers

  namespace :admin do
    resources :items

  end

  scope module: :public do
    root to: "homes#top"
    resources :items
    resources :orders, only: [:new, :confirm, :thanks, :create, :index, :show ]
  end
  #あとで消す
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
