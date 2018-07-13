Rails.application.routes.draw do
  devise_for :users

  root "questions#index"

  resources :questions

  namespace :admin do
    root "questions#index"
    resources :questions, only: [:index, :destroy]
    resources :users, only: [:index, :update, :destroy]
  end

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      post "/login" => "auth#login"
      post "/logout" => "auth#logout"
    end
  end

end
