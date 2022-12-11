class CreditCardPaymentsController < ApplicationController
  before_action :authenticate_user!


  def index
    @credit_card_payment = CreditCardPayment.new
  end

  def create
    # binding.pry
    @credit_card_payment = CreditCardPayment.new(credit_card_payment_params)
    if @credit_card_payment.valid?
      payjp_credit_card
      @credit_card_payment.save
      flash[:notice1] = "クレジットカード支払いが完了しました。"
      flash[:notice2] = "ご質問等は班長まで問い合わせください。"
      flash[:notice2] = "ご質問等は班長まで問い合わせください。"
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def credit_card_payment_params
    params.require(:credit_card_payment).permit(:price, :name, :period, :note).merge(user_id: current_user.id, token: params[:token])
  end

  def payjp_credit_card
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 環境変数にて処理
    Payjp::Charge.create(
      amount: credit_card_payment_params[:price],  # 商品の値段
      card: credit_card_payment_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
