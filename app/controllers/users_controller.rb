class UsersController < ApplicationController
  def show #showアクションで表示するのは、ログイン中ユーザーのマイページ
    # クリックしたユーザーのページに遷移できるようにする実装
    user = User.find(params[:id])
    # infoの右下に表示されるユーザー名をクリックすることで、送られたidをparamsで取得、そのユーザーのレコードを変数userに代入。
    # この変数を利用して、各インスタンス変数ではcurrent_userを変数userに変える。
    @nickname = current_user.nickname #「ログイン中のユーザーのnickname」 
    @infos = current_user.infos #「ログイン中のユーザーのinfo投稿」、アソシエーションを利用しuser.infosとすることで、そのユーザーが投稿したinfoを取得して、@infosに代入
  end
end
