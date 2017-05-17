Rails.application.routes.draw do
  resources :products, except: :index
  devise_for :users
  root "static_pages#show", page: "home"
  get "/staticpages/*page" => "static_pages#show"
  get "/manage_product" => "static_pages#manage_product"
end
