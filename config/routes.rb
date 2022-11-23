Rails.application.routes.draw do
  devise_for :users #ユーザー機能
  root to: 'infos#index'
  resources :infos #7つのアクションをまとめてルーティングの設定
  resources :users, only: :show #/users/:idのパスでリクエストした際にusers_controller.rbのshowアクションを実行

end
