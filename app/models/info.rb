class Info < ApplicationRecord
  validates :text, presence: true
  
  #  アソシエーション
  belongs_to :user
  has_many :comments  
  # //アソシエーション
  
  # whereメソッドとLIKE句を使用して検索の処理
  def self.search(search) #引数のsearchは、検索フォームから送信されたパラメーターが入る
    if search != "" #検索フォームに何か値が入力されていた場合を条件
      Info.where('text LIKE(?)', "%#{search}%")
    else
      Info.all #引数で渡されるsearchの中身は空の場合、elseに該当し、Info.allで、すべての投稿を取得して表示
    end
  end
  # //whereメソッドとLIKE句を使用して検索の処理
end
