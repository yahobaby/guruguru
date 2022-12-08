class CreditCardPayment < ApplicationRecord
  validates :price, presence: true #町内会金額データベース
  belongs_to :user
end
