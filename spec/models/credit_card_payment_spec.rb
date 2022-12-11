require 'rails_helper'

RSpec.describe CreditCardPayment, type: :model do

  before do
    @credit_card_payment = FactoryBot.build(:credit_card_payment)
  end

  context '内容に問題ない場合' do
    it "priceとtokenがあれば保存ができること" do
      expect(@credit_card_payment).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "priceが空では保存ができないこと" do
      @credit_card_payment.price = nil
      @credit_card_payment.valid?
      expect(@credit_card_payment.errors.full_messages).to include("Price can't be blank")
    end

    it "tokenが空では登録できないこと" do
      @credit_card_payment.token = nil
      @credit_card_payment.valid?
      expect(@credit_card_payment.errors.full_messages).to include("Token can't be blank")
    end

  end


end
