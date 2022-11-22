Rails.application.routes.draw do
  root to: 'infos#index'
  resources :infos #7つのアクションをまとめてルーティングの設定
end
