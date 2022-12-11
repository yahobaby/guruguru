class CommentsController < ApplicationController
  def create # コメント作成機能
    comment = Comment.create(comment_params)
    redirect_to "/infos/#{comment.info.id}"
    # コメントを保存したのち、コメントしたinfoの詳細画面へリダイレクト(コメントと結びつくinfoの詳細画面に遷移する)
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, info_id: params[:info_id])
    # 渡されたparamsの中にcommentというハッシュがある二重構造になっているため、requireメソッドの引数に指定して、textを取り出し
    # user_idカラム = ログインしているユーザーのidとなるcurrent_user.idを保存
    # info_idカラム = paramsで渡されるようにするので、params[:info_id]として保存
  end
end
