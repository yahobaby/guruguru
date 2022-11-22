Rails.application.routes.draw do
  root to: 'infos#index'
  resources :infos, only: [:index, :new, :create, :destroy, :edit, :update]
end
