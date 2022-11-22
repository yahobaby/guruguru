class InfosController < ApplicationController
  def index
    # infosテーブルすべてのレコードをインスタンス変数に代入、ビューに受け渡す。
    @infos = Info.all
  end

  def new
    # info投稿画面（new.html.erb）でform_withヘルパーメソッド使用の為、必要なインスタンス変数を定義。
    @info = Info.new
  end

  def create
    Info.create(info_params)
  end

  def destroy
    # destroyアクションは、ツイートを削除するだけで、ビューにツイート情報を受け渡す必要がなく、インスタンス変数ではなくただの変数として定義
    info = Info.find(params[:id])
    info.destroy
  end

  private
  def info_params
    params.require(:info).permit(:name, :image, :text)
  end
end
