Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get '/about' => 'homes#about'
  resources :users
  # get '/users' => 'users#index'
  # get '/users/:id' => 'users#show'
  # get '/users/:id/edit' => 'users#edit'
  # patch '/users/:id' => 'users#update'

  resources :drinks, only: [:index, :create, :edit, :update, :destroy, :show] do
    collection do
      get :search
    end
  end
end
