class PurchasesController < ApplicationController
  def new
  end

  def create
    nonce = params[:payment_method_nonce]
    result = Braintree::Transaction.sale(
        :amount => "10.00",
        :payment_method_nonce => nonce
    )
    flash[:success] = 'Payment made successfully'
  end

  def checkout
  end

  def trip
    @trip = Trip.find(params[:trip_id])
    @start_date = params[:start_date]
  end
end
