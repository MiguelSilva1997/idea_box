Rails.application.routes.draw do
  resources :user, except: [:index] do
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
  delete "/logout", to: "sessions#destroy"
end
