Rails.application.routes.draw do

  namespace :admin do
    get 'orders/show'
  end
  # 管理者用
  devise_for :admin, controllers: {
  sessions: "admin/sessions"
  }
  # 顧客用
  devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  # 管理者
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    root to: "home#top"
    resources :orders, only: [:show] do
      resources :order_details, only: [:update]
    end
  end


  # 顧客
  scope module: :public do
    root to: "home#top"
    get 'home/about' => 'home#about'
    patch 'customers/withdraw' => 'customers#withdraw'
    get 'customers/mypage' => 'customers#show'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    resources :customers, only: [:edit, :update]
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :items, only: [:index, :show]

    # post 'cart_items/create' => 'cart_items#create'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    resources :orders, only: [:new, :index, :show, :create]
    
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
