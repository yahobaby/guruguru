class InfosController < ApplicationController
  def index
    # infosテーブルすべてのレコードをインスタンス変数に代入、ビューに受け渡す。
    @infos = Info.all
  end
end
