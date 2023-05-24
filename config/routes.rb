Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get 'restaurants', to: 'restaurants#index'
  # get 'restaurants/:id', to: 'restaurants#show', as: 'show'
  # get 'restaurants/new', to: 'restaurants#new'
  # post 'restaurants', to: 'restaurants#create'
  # get 'restaurants/:id/reviews', to: 'views#create', as: 'reviews'
  # post 'restaurants/:id/reviews/new', to: 'views#new'
  resources :restaurants do
    resources :reviews, only: [:create]
  end
end
