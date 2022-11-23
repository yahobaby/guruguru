class Info < ApplicationRecord
  validates :text, presence: true
  
  #  アソシエーション
  belongs_to :user
  # //アソシエーション  
end
