Rails.application.routes.draw do
  resources :users, except: [:index] do
    resources :ideas
  end

  namespace :admin do
    resources :categories
    resources :images
    resources :ideas,  only: [:index, :show]
    resources :users, only: [:index, :show]
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get "/dashboard", to: "admin/base#dashboard"
  get "/", to: "base#index"
end
