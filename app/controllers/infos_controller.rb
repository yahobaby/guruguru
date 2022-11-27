class InfosController < ApplicationController
  before_action :set_info, only: [:edit, :show] # editとshowアクションにおいて、@info = Info.find(params[:id])部分が重複してた為
  before_action :move_to_index, except: [:index, :show, :search] #ログインしていなくても、一覧ページ、詳細ページに遷移でき、検索機能が使える仕様にするためにexcept: [:index, :show, :search]



  def index
    # infosテーブルすべてのレコードをインスタンス変数に代入、ビューに受け渡す。
    # @infos = Info.all
    @infos = Info.includes(:user).order("created_at DESC") #includesメソッドを使用してN+1問題を解消
    # includesメソッドで、引数に指定された関連モデルを1度アクセスでまとめて取得
    # ("created_at DESC")で、レコード降順に並び替える。

  end

  def new
    # info投稿画面（new.html.erb）でform_withヘルパーメソッド使用の為、必要なインスタンス変数を定義。
    @info = Info.new
  end

  def create
    # info_paramsストロングパラメーターを定義、createメソッドの引数にして、infosテーブルへ保存できるようにする。
    Info.create(info_params)
  end

  def destroy
    # destroyアクションは、ツイートを削除するだけで、ビューにツイート情報を受け渡す必要がなく、インスタンス変数ではなくただの変数として定義
    info = Info.find(params[:id])
    info.destroy
  end

  def edit
    # 編集したいレコードを@infoに代入し、ビューに受け渡すことで編集画面で利用できるようにする。
    # form_withで使用する@infoの中身が入った状態にしておく。
  end

  def update
    # updateアクションも、destroyアクションと同様、ビューファイルへ情報を受け渡す必要がなく、インスタンス変数ではなくただの変数として定義
    info = Info.find(params[:id])
    info.update(info_params)
  end

  def show
    # 詳細を表示したいinfo情報をビューに受け渡すだけ
    @comment = Comment.new
    # infos/show.html.erbでform_withを使用して、comments#createを実行するリクエストを飛ばしたく、@comment = Comment.newというインスタンス変数を生成
    @comments = @info.comments.includes(:user)
    # infosテーブルとcommentsテーブルはアソシエーションが組まれているので、@info.commentsとすることで、@infoへ投稿されたすべてのコメントを取得
    # ビューでは誰のコメントか明らかにするため、アソシエーションを使ってユーザーのレコードを取得する処理を繰り返し,「N+1問題」が発生してしまうので、includesメソッドを使って、N+1問題を解決
  end

  def search #検索機能
    @infos = Info.search(params[:keyword]) #params[:keyword]と記述して、検索結果を渡す
  end

  private
  def info_params
    params.require(:info).permit(:image, :text, :title).merge(user_id: current_user.id) # current_userで現在ログインしているユーザーの情報を取得
    # info情報を持つハッシュと、user_idを持つハッシュを結合
  end

  def set_info
    @info = Info.find(params[:id])
  end

  def move_to_index
    # user_signed_in?を判定して、その返り値がfalseだった場合にredirect_toが実行
    unless user_signed_in?
      # →ユーザーがログインしていない場合にはindexアクションが実行
      redirect_to action: :index
    end
  end

end
