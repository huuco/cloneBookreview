Rails.application.routes.draw do
  root "static_pages#home"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :my_requests, only: :index

  resources :users do
    resources :member do
      get :following, :followers
    end
  end

  resources :books, only: :show do
    resources :ratings
    resources :user_books
  end

  resources :search_books, only: :index
  resources :mark_books, only: :index
  resources :account_activations, only: :edit
  resources :requests
  resources :relationships, only: %i(create destroy)

  namespace :admin do
    resources :books
    resources :requests, only: %i(index edit update)
  end
end
