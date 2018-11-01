Rails.application.routes.draw do
	root 'static_pages#home'
  get 'static_pages/home'
  resources :gossips do
    resources :comments, only: [:new, :create, :show, :index, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
