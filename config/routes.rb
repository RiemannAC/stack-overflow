Rails.application.routes.draw do
  devise_for :users

  root "questions#index"

  resources :questions do
    resources :answers, only: [:create, :destroy]
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


  namespace :admin do
    root "questions#index"
    resources :questions, only: [:index, :destroy]
    resources :users, only: [:index, :update, :destroy]
  end
end
