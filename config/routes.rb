Rails.application.routes.draw do
  devise_for :users
  
  root 'products#index'
  resources :products
  resources :orders
  resources :carts do 
    post 'add_to_cart/:product_id', to: 'carts#add_to_cart', as: 'add_to_cart'
    post 'remove_from_cart/item_id', to: 'carts#remove_from_cart', as: 'remove_from_cart'
  end
end
