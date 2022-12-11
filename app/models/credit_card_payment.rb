class CreditCardPayment < ApplicationRecord
  attr_accessor :token # tokenの値もcredit_card_oaymentモデルで取り扱えるようにする

  validates :price, presence: true # 町内会金額データベース
  validates :name, presence: true
  # 期間は、4桁内の半角数値のみ保存可能
  validates :period, presence: true, format: { with: /\A[0-9]{4}\z/, message: 'is invalid' }
  validates :token, presence: true
  belongs_to :user
end
