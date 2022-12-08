Rails.application.routes.draw do
  devise_for :users #ユーザー機能
  root to: 'infos#index'
  resources :credit_card_payments, only: [:index, :create]
  resources :infos do #7つのアクションをまとめてルーティングの設定
    resources :comments, only: :create #アソシエーション先のレコードのidをparamsに追加してコントローラーに送るためにネスト, #コメント情報を作る機能
    collection do
      get 'search'
    end
  end
  resources :users, only: :show #/users/:idのパスでリクエストした際にusers_controller.rbのshowアクションを実行
  # get 'credit_card_payments', to: 'credit_card_payments#index'
end
