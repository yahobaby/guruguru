class Info < ApplicationRecord
  validates :text, presence: true
  
  #  アソシエーション
  belongs_to :user
  has_many :comments  
  # //アソシエーション  
end
