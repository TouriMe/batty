class PurchasesController < ApplicationController
  before_action(except: :create) { @purchase = Purchase.find(params[:id])}

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.status = 'unpaid'
    # @purchase.tourist = current_normal_user if current_normal_user

    # TODO: redirect_back if wrong
    @purchase.save
    redirect_to edit_purchase_path(@purchase)
  end

  def edit
  end

  def update
    nonce = params[:payment_method_nonce]
    result = Braintree::Transaction.sale(
        :amount => @purchase.purchasable.price,
        :payment_method_nonce => nonce
    )
    p result
    if result.success?
      @purchase.status = :paid
      @purchase.save
      flash[:success] = 'Payment made successfully'
      puts 'result is successful'
      render 'success'
    else
      flash[:error] = 'there is error with your payment'
      puts 'got error'
      render 'edit'
    end
  end

  private
  def purchase_params
    params.require(:purchase).permit(:purchasable_id, :purchasable_type, :start_date, :email)
  end
end
