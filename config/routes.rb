Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  # 測試commit 後 push
end
