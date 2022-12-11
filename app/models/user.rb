class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #  アソシエーション
  has_many :infos
  has_many :comments
  has_many :credit_card_payments
  # //アソシエーション

  validates :nickname, presence: true
end
