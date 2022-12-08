class CreditCardPaymentsController < ApplicationController
  before_action :authenticate_user!


  def index
    @credit_card_payment = CreditCardPayment.new
  end

  def create
    @credit_card_payment = CreditCardPayment.new(credit_card_payment_params)
    if @credit_card_payment.valid?
      @credit_card_payment.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def credit_card_payment_params
    params.require(:credit_card_payment).permit(:price, :name, :period, :note).merge(user_id: current_user.id)
  end

end
