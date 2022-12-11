class CreditCardPayment < ApplicationRecord
  attr_accessor :token #tokenの値もcredit_card_oaymentモデルで取り扱えるようにする
  validates :price, presence: true #町内会金額データベース
  validates :name, presence: true
  validates :period, presence: true
  validates :token, presence: true
  belongs_to :user
end
