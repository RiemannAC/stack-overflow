Rails.application.routes.draw do
  devise_for :users
  root "posts#index"

  resources :posts do
   member do
      post :favorite
      post :unfavorite
    end
  end


  resources :users do
   member do
     get :favorite
     get :unfavorite
    end
  end


end
