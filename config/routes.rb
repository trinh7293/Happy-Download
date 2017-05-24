Rails.application.routes.draw do
  root "products#index"
  get "/static_pages/*page", to: "static_pages#show"
  get "/manage_product", to: "manage_products#index"
  devise_for :users
  resources :products, except: :index
  resources :feedbacks
  post "/rate", to: "rater#create", as: "rate"
end
