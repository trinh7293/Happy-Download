Rails.application.routes.draw do
  resources :products, except: :index
  devise_for :users
  root "products#index"
  get "/static_pages/*page", to: "static_pages#show"
  get "/manage_product", to: "manage_products#index"
end
