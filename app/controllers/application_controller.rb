class ApplicationController < ActionController::Base
  #before_actionを使い各アクションの事前処理として設定
  before_action :configure_permitted_parameters, if: :devise_controller?
  

  private
  def configure_permitted_parameters
    #sign_up（新規登録の処理）に対して、nicknameというキーのパラメーターを許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

end
