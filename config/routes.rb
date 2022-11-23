Rails.application.routes.draw do
  devise_for :users #ユーザー機能
  root to: 'infos#index'
  resources :infos #7つのアクションをまとめてルーティングの設定
end
