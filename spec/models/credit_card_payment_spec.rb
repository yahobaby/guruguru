# % bundle exec rspec spec/models/credit_card_payment_spec.rb 

require 'rails_helper'

RSpec.describe CreditCardPayment, type: :model do

  before do
    @user = FactoryBot.build(:user)
    @credit_card_payment = FactoryBot.build(:credit_card_payment)
  end

 describe 'クレジットカード支払い機能' do 
  context '内容に問題ない場合' do
    it "内容に問題ない場合保存できる" do
      expect(@credit_card_payment).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "支払い額が空では登録できない" do
      @credit_card_payment.price = nil
      @credit_card_payment.valid?
      expect(@credit_card_payment.errors.full_messages).to include("Price can't be blank")
    end

    it "世帯主名が空では登録できない" do
      @credit_card_payment.name = nil
      @credit_card_payment.valid?
      expect(@credit_card_payment.errors.full_messages).to include("Name can't be blank")
    end

    it "期間が空では登録できないこと" do
      @credit_card_payment.period = nil
      @credit_card_payment.valid?
      expect(@credit_card_payment.errors.full_messages).to include("Period can't be blank")
    end

    it "期間が半角数字3桁以下では登録できないこと" do
      @credit_card_payment.period = 203
      @credit_card_payment.valid?
      expect(@credit_card_payment.errors.full_messages).to include("Period is invalid")
    end

    it "期間が半角数字5桁以上では登録できないこと" do
      @credit_card_payment.period = 20333
      @credit_card_payment.valid?
      expect(@credit_card_payment.errors.full_messages).to include("Period is invalid")
    end
  end
end
end