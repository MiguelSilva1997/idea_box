Rails.application.routes.draw do
  resources :user do
    resources :ideas
  end

  namespace :admin do
    resources :categories
    resources :images
    resources :ideas
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
