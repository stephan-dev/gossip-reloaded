Rails.application.routes.draw do
  get 'users/home'
  get 'users/login'
	root 'static_pages#home'
  get 'static_pages/home'
  resources :gossips do
    resources :comments, only: [:new, :create, :show, :index, :destroy]
  end
  get 'users/home' => 'users#home'
  get 'users/login' => 'users#login'
  post 'users/login' => 'users#check'
  get 'users/new' => 'users#new'
  post 'users/new' => 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
