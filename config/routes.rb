Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  Rails.application.routes.draw do
   
    resources :users
    resources :categories
    resources :orders
    resources :carts
    resources :products
    resources :carted_products
    resources :sessions, only: [:new, :create, :destroy]


    resources :orders do
      resources :carted_products, only: [:index, :create, :destroy]
    end
    
    get 'cart', to: 'carts#show', as: 'current_cart'
    
    post 'cart', to: 'carted_products#create', as: 'add_to_cart'
    
    delete 'cart/:id', to: 'carted_products#destroy', as: 'remove_from_cart'
  end
  
end
