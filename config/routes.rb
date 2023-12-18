Rails.application.routes.draw do


  #devise_for :customers
  #devise_for :admins

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get 'order_details/update'
  end
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'costomers/index'
    get 'costomers/show'
    get 'costomers/edit'
    get 'costomers/update'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
  end
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/create'
    get 'items/show'
    get 'items/edit'
    get 'items/update'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :admin do
    get 'sessions/new'
    get 'sessions/create'
    get 'sessions/destroy'
  end

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:new, :create, :index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :create]
    resources :items, only: [:index, :show]
    resources :sessions, only: [:new, :create, :destroy]
    resources :registrations, only: [:new, :create]
    resources :customers, only: [:show]
    get "customers/show" => "customers#show"
    get "customers/information/edit" => "customers#edit"
    patch "customers/information" => "customers#update"
    get 'customers/unsubscribe' => "customers#unsubscribe"
    patch 'customers/withdraw' => "customers#withdraw"
    get 'orders/confirm' => 'orders#confirm'
    get 'orders/thanks' => 'orders#thanks'
    get 'cart_items/destroy_all' => 'cart_items#destroy_all'
  end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
