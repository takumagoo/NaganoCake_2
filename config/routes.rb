Rails.application.routes.draw do
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
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
    
    root to: "home#top"
  end


  # 顧客
  scope module: :public do

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
