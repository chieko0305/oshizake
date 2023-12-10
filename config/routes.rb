Rails.application.routes.draw do
  post 'guest_sign_in', to: 'sessions#guest_sign_in'
  get 'relationships/followings'
  get 'relationships/followers'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get '/about' => 'homes#about'
  # get '/mypage' => 'homes#mypage'
  resources :users, only: [:index, :edit, :update, :show] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    collection do
      get :mypage
    end
    member do
    get :favorites
    end
  end
  # get '/users' => 'users#index'
  # get '/users/:id' => 'users#show'
  # get '/users/:id/edit' => 'users#edit'
  # patch '/users/:id' => 'users#update'

  resources :drinks, only: [:index, :create, :edit, :update, :destroy, :show] do
    resource :favorite, only: [:create, :destroy]
    collection do
      get :search
    end
    # member do
    # get :favorites
    # end
  end
end
