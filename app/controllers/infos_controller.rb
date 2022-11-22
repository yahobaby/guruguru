class InfosController < ApplicationController
  before_action :set_info, only: [:edit, :show] # editとshowアクションにおいて、@info = Info.find(params[:id])部分が重複してた為


  def index
    # infosテーブルすべてのレコードをインスタンス変数に代入、ビューに受け渡す。
    @infos = Info.all
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
    @info = Info.find(params[:id])
  end

  def update
    # updateアクションも、destroyアクションと同様、ビューファイルへ情報を受け渡す必要がなく、インスタンス変数ではなくただの変数として定義
    info = Info.find(params[:id])
    info.update(info_params)
  end

  def show
    # 詳細を表示したいinfo情報をビューに受け渡すだけ
    @info = Info.find(params[:id])
  end

  private
  def info_params
    params.require(:info).permit(:name, :image, :text)
  end

  def set_info
    @info = Info.find(params[:id])
  end
end
