class UsersController < ApplicationController
  def show #showアクションで表示するのは、ログイン中ユーザーのマイページ
    @nickname = current_user.nickname #「ログイン中のユーザーのnickname」 
    @infos = current_user.infos #「ログイン中のユーザーのinfo投稿」
  end
end
