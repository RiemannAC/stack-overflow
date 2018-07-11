Rails.application.routes.draw do
  devise_for :users
  root "posts#index"

  resources :posts
  resources :users do
   member do
     post :favorite
     post :unfavorite
    end
  end
end
