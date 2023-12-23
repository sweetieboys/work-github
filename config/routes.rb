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
    get "/" => "homes#top"
    resources :order_details,only: [:update]
    resources :orders,only: [:show,:update]
    resources :customers,only: [:index,:show,:edit,:update]
    resources :genres,only: [:index,:create,:edit,:update]
    resources :items, only: [:index,:new,:create,:show,:edit,:update]
  end


  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/thanks' => 'orders#thanks'
    resources :orders, only: [:new, :create, :index, :show]
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :create]
     



    get "customers/show" => "customers#show"
    get "customers/information/edit" => "customers#edit"
    patch "customers/information" => "customers#update"
    patch 'customers/unsubscribe' => "customers#unsubscribe"
    get 'customers/withdraw' => "customers#withdraw"
    get 'cart_items/destroy_all' => 'cart_items#destroy_all'
  end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
