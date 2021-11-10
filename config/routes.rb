Rails.application.routes.draw do

  get 'about/index'
  get 'checkout/create'
  # devise_for :users, :controllers => { :registrations => 'users/registrations' }
  devise_for :users, :controllers => {:registrations => "users/registrations"}


  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #root to: "products#index"
  root to: "products#list"
  resources :products do
    resources :comments
    resources :reviews
  end
  mount ActionCable.server => '/cable'
  resources :carts
  resources :order_details
  resources :categories
  #resources :checkout
  post "checkout/create", to: "checkout#create"
  get "/search", to: "products#search"
  resources :orders
  resources :about 
  
end
