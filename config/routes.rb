Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static_pages#home"

  get "/home", to: "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/books", to: "books#index"
  resources :users
  resources :books
  resources :categories
  resources :request_details
  resources :requests
  resources :likes, only: %i(create destroy)
  resources :comments
  resources :ratings, only: :create
  namespace :admin do
    root "static_pages#index"
    resources :books
    resources :requests
    resources :categories
  end
end
